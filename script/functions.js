$('input[type="number"]').on('keypress', function(event) {
    if ((event.keyCode < 48 || event.keyCode > 57)){
        event.preventDefault();
    }
});


$('.all_inputs').keydown(function(typedKey) {
    if (typedKey.keyCode === 32) {
        typedKey.preventDefault();
    }
});




// START => PASSWORD FUNCTION

$(document).ready(function() {
    $('.password_items').each(function() {
        const $parent = $(this);
        $parent.children().each(function() {
            if($(this).hasClass('hidden_eye_Password')){
                $(this).on('click', function() {
                    if ($(this).prev().length && $(this).prev().attr('type') === 'password') {
                        $(this).prev().attr('type', 'text');
                        $(this).find('.eye_password_2').css('display', 'block');
                        $(this).find('.eye_password_1').css('display', 'none');
                    } else {
                        $(this).prev().attr('type', 'password');
                        $(this).find('.eye_password_1').css('display', 'block');
                        $(this).find('.eye_password_2').css('display', 'none');
                    }
                });
            }
        });
    });
});



// START => PHONE STYLES

if($('.phone').length > 0){
    $(".phone").intlTelInput({
        initialCountry: "am",
        separateDialCode: false,
        geoIpLookup: function(callback) {
            $.get('https://ipinfo.io', function() {}, "jsonp").always(function(resp) {
                var countryCode = (resp && resp.country) ? resp.country : "";
                callback(countryCode);
            });
        },
        utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/11.0.14/js/utils.js"
    });
    
    let mask1 = $(".phone").attr('placeholder').replace(/[0-9]/g, 0);
    
    $(document).ready(function(){
        $(".phone").mask(mask1);
    });
    
    $(".phone").on("countrychange", function() {
        $(".phone").val('');
        let mask1 = $(".phone").attr('placeholder').replace(/[0-9]/g, 0);    
        $(".phone").mask(mask1);
    });
}

// START => OPEN & CLOSE DASHBOARD


$(document).ready(function(){
    $(document).on('click', '.close_btn', function(){
        $('.dashboard').toggleClass('expanded');
        $('.product_items').removeClass('open_product_items');
        $(".dropdown .arow_svg").removeClass("rotate180");
        $('#span1, #span2, #span3').each(function(){
            $(this).toggleClass('close_' + this.id);
        });
    });
    $('.product').each(function(){
        $(this).on('click', function(){
            $(this).children(".dropdown ").children(".arow_svg").toggleClass("rotate180");
            $(this).children(".product_items").toggleClass("open_product_items");
            if(!$('.dashboard').hasClass('expanded')){
                $('.dashboard').toggleClass('expanded');
                $('#span1, #span2, #span3').each(function(){
                    $(this).toggleClass('close_' + this.id);
                });
            }
        })
    });
});




// START => UPLOAD & PREVIEW IMAGE

$('.get_img_value').change(function(){
    var curElement = $(this).prev('img');
    var reader = new FileReader();
    reader.onload = function (e) {
        curElement.attr('src', e.target.result);
    };
    reader.readAsDataURL(this.files[0]);
});


// START => MODEL APPEAR

$('.remove_from_cart').each(function(){
    $(this).click(function(){
        $('.card').addClass('crad_active');
        $('body').addClass('bachground_black');
    })

    $('.close_model').click(function(){
        $('.card').removeClass('crad_active');
        $('body').removeClass('bachground_black');
    })
})

$('.delete_custom').click(function(){
    
})




