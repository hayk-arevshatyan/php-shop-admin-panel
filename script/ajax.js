// START => VALIDATION

    
let validInput = true;
    
function isValid(){
    if($('.all_inputs').hasClass('red_line') || $('.product_inputs').hasClass('red_border')){
        validInput = false;
    }else{
        validInput = true;
    }
}

let validation = {
    name: {
        message: 'Name in not valid!',
        regex: /^[\p{L}]+$/u,
    },

    surname: {
        message: 'Surname in not valid!',
        regex: /^[\p{L}]+$/u,
    },

    mail: {
        message: 'Mail in not valid!',
        regex: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,
    },

    phone: {
        message: 'Phone number in not valid!',
        regex: /\+?[0-9]{6,15}(?:[-\s.]?[0-9]{1,4})*/,
    },

    password: {
        message: 'Password is invalid!',
        regex: /^[A-Za-z0-9]+$/,
    },

    repeat_password: {
        message: 'Password is invalid!',
        regex: /^[A-Za-z0-9]+$/,
    }
}

function validate(){
    $('.all_inputs').each(function(){
        let input = $(this);
        for(let method in validation){
            let objMethods = validation[method];
            if(input.attr('name') == method){
                if($('.' + method)){
                    if(input.val() == '' || !objMethods.regex.test(input.val())){
                        input.addClass('red_line');
                        $('.' + method + '_message').text(objMethods.message);
                    }else{
                        input.removeClass('red_line');
                        $('.' + method + '_message').text('');
                    }
                }
            }
        }
    })
}


// START => REGISTRATION

if($('.reg_btn')){
    $('.reg_btn').on('click', function(){
        validate();
        isValid();
        if(validInput){
            let user = {
                name: $('.name').val(),
                surname:$('.surname').val(),
                mail:$('.mail').val(),
                phone:$('.phone').val(),
                gender:$('.gender').val(),
                password:$('.password').val(),
                repeat_password:$('.repeat_password').val(),
                action:'registration'
            }

            $.post('../auth/function.php', user, function(regBackCall) {
                if(regBackCall.success){
                    alert(regBackCall.message);
                }else{
                    let mistakeValid = regBackCall.error;
                    $('.message').html('');
                    for(spanMessage in mistakeValid){
                        $('.' + spanMessage).addClass('red_line');
                        $('.' + spanMessage + '_message').html(mistakeValid[spanMessage]);
                    }
                }
            }, 'json');
        }
    })
}


// START => LOG IN



if ($('.log_btn')) {
    $('.log_btn').on('click', function(){
        validate();
        isValid();
        if(validation){
            let logData = {
                mail:$('.mail').val(),
                password:$('.password').val(),
                action: 'login'
            }

            $.post('../auth/function.php', logData, function(logBackCall){
                if(logBackCall.success){
                    window.location = logBackCall.toAccount;
                }else{
                    let mistakeLog = logBackCall.error;
                    $('.message').html('');
                    for(index in mistakeLog){
                        $('.' + index).addClass('red_line');
                        $('.' + index + '_message').html(mistakeLog[index]);
                    }
                }
            }, 'json');
        }
    })
}

// START => MAIL VALIDATION


if ($('.forgotPassMail_btn')) {
    $('.forgotPassMail_btn').on('click', function(){
        validate();
        isValid();
        if(validation){
            let mailData = {
                mail: $('.mail').val(),
                action: 'mail'
            }

            $.post('../auth/function.php', mailData, function(mailBackCall){
                if(mailBackCall.success){
                    alert(mailBackCall.message);
                }else{
                    console.log(mailBackCall.error);
                    let mistakeMail = mailBackCall.error;
                    $('.message').html('');
                    for(index in mistakeMail){
                        $('.' + index).addClass('red_line')
                        $('.' + index + '_message').html(mistakeMail[index]);
                    }
                }
            }, 'json');
        }
    })
}


// START => FORGOT PASSWORD


if ($('.forgotPassword_btn')) {
    $('.forgotPassword_btn').on('click', function(){
        validate();
        isValid();
        if(validation){
            let passwordData = {
                password: $('.password').val(),
                repeat_password: $('.repeat_password').val(),
                action: 'newPassword'
            }

            $.post('../auth/function.php', passwordData, function(changePassword){
                if(changePassword.success){
                    window.location = changePassword.backToLog;
                }else{
                    console.log(changePassword.error);
                    let mistakePassword = changePassword.error;
                    $('message').html('');
                    for(index in mistakePassword){
                        $('.' + index).addClass('red_line')
                        $('.' + index + '_message').html(mistakePassword[index]);
                    }
                }
            }, 'json');
        }
    })
}



// START => ADD PRODUCT

function productInp(){
    $('.product_inputs').each(function(){
        if($.trim($(this).val()) == ''){
            $(this).addClass('red_border');
            $(this).next('span').text($(this).attr('name') + ' is empty.');

        }else{
            $(this).removeClass('red_border');
            $(this).next('span').text('');
        }
    });
}


if($('.add_btn')){
    $('.add_btn').on('click', function(){
        productInp();
        isValid();
        if(validInput){
            let productData = {
                product_name:$.trim($('.product_name').val()),
                product_category:$.trim($('.product_category').val()),
                product_img:$('.get_img_value').val(),
                product_price:$.trim($('.product_price').val()),
                product_quantity:$.trim($('.product_quantity').val()),
                product_desription:$.trim($('.product_desription').val()),
                action:'addProduct'
            }
            $.post('../auth/function.php', productData, function(productBackCall){
                if(productBackCall.success){
                    window.location = productBackCall.leaveToList;
                }else{
                    let productError = productBackCall.error;
                    for(let index in productError){
                        $('.' + index + '_message').text(productError[index]);
                        $('.' + index).addClass('red_border');
                    }
                }
            }, 'json');
        }else{
            alert('you have empty input.');
        }
    })
}


// START => EDIT PRODUCT


if($('.edit_btn')){
    $('.edit_btn').each(function(){
        $(this).on('click', function(){
            let product = {
                id:$(this).attr('id'),
                action:'editProduct'
            }
            $.post('../auth/function.php', product, function(editProduct){
                if(editProduct.success){
                    localStorage.setItem('productInfo', JSON.stringify(editProduct.productValues));
                    window.location = editProduct.editLink;
                }else{
                    alert(editProduct.error);
                }
            }, 'json');
        })
    })
}


// START => DELETE PRODUCT

$('.close_model').on('click', function(){
    $('.conteiner_model').removeClass('open_model');
    deletedProduct = false;
})

if($('.delete_btn')){
    $('.delete_btn').each(function(){
        $(this).on('click', function(){
            let deleteBtn = $(this);
            $('.conteiner_model').addClass('open_model');
            $('.agree').on('click', function(){
                $('.conteiner_model').removeClass('open_model');
                let deleteData = {
                    id: deleteBtn.attr('id'),
                    action:'deleteProduct'
                }
                $.post('../auth/function.php', deleteData, function(deleteBackCall){
                    if(deleteBackCall.success){
                        deleteBtn.closest('.product_conteiner').remove();
                    }else{
                        alert(deleteBackCall.error);
                    }
                }, 'json');
            })
        })
    })
}


// start => update product


if($('.update_product')){
    let productInfo = localStorage.getItem('productInfo');
    productInfo = JSON.parse(productInfo);
    $('.edit_product_img').attr('src', productInfo.product_img);
    for (let key in productInfo) {
        $('.edit_' + key).val(productInfo[key]);
    }
    productInfo = '';
    $('.update_product').on('click', function(){
        productInp();
        isValid();
        if(validInput){
            let productData = {
                product_name:$.trim($('.edit_product_name').val()),
                product_category:$('.edit_product_category').val(),
                product_img:$('.get_img_value').val(),
                product_price:$.trim($('.edit_product_price').val()),
                product_quantity:$.trim($('.edit_product_quantity').val()),
                product_desription:$.trim($('.edit_product_desription').val()),
                action:'updateProduct'
            }
            $.post('../auth/function.php', productData, function(editBackCall){
                if(editBackCall.success){
                    window.location = editBackCall.leaveToList;
                }else{
                    let editError = editBackCall.error;
                    for(let index in editError){
                        $('.' + index + '_message').text(editError[index]);
                        $('.edit_' + index).addClass('red_border');
                    }
                }
            }, 'json');
        }else{
            alert('you have empty input.');
        }
    });
}

// start => login

if($('.logout_btn')){
    $('.logout_btn').on('click', function(){
        let logoutData = {
            action: 'LogOut'
        }
        $.post('../auth/function.php', logoutData, function(logOut){
            if(logOut.success){
                console.log(true);
                window.location = logOut.outLink;
                
            }else{
                console.log(logOut.error);
            }
        }, 'json');
    });
}