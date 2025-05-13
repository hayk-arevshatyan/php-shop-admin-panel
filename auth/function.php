<?php
session_start();
require_once "./db.php";

require '../phpMailer/Exception.php';
require '../phpMailer/PHPMailer.php';
require '../phpMailer/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;


$error = [];
$regex_username = "/^[a-zA-Z]+$/";
$regex_mail = "/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/";
$regex_phone = '/\+?[0-9]{6,15}(?:[-\s.]?[0-9]{1,4})*/';
$regex_password = '/^[A-Za-z0-9]+$/';
$regex_price = '/^\d{1,10}(\.\d{1,2})?$/';
$regex_quantity = '/^[1-9]\d*$/';


// START => REGISTRATION
    
if(!empty($_POST) && $_POST['action'] == 'registration'){
    extract($_POST);
    if(strlen($name) < 3 || !preg_match($regex_username, $name)){
        $error['name'] = 'Name is invalid';
    }

    if(strlen($surname) < 3 || !preg_match($regex_username, $surname)){
        $error['surname'] = 'Surname is invalid';
    }

    if(empty($mail) || !preg_match($regex_mail, $mail)){
        $error['mail'] = 'Mail is invalid';
    }

    if(empty($phone) || !preg_match($regex_phone, $phone)){
        $error['phone'] = 'Phone number is invalid';
    }

    if(strlen($password) < 8 || !preg_match($regex_password, $password) || $password != $repeat_password){
        $error['password'] = 'Password is invalid';
    }

    if(strlen($repeat_password) < 8 || !preg_match($regex_password, $repeat_password) || $repeat_password != $password){
        $error['repeat_password'] = 'Password is uncorect.';
    }

    if(!empty($error)){
        echo json_encode(['success' => false, 'error' => $error]);
        exit;
    }else{
        $qb_user = "SELECT * FROM `user` WHERE `mail` = '$mail'";
        $user =  $conn->query($qb_user);
        if($user->num_rows > 0){
            $error['mail'] = 'Use other mail to register.';
            echo json_encode(["success" =>false, "error" => $error]);
            exit;
        }else{
            $token = md5($mail.time());
            $password = password_hash($password, PASSWORD_DEFAULT);
            $qb_register = "INSERT INTO `user`(`name`, `surname`, `mail`, `phone`, `gender`, `password`, `token`) VALUES ('$name','$surname','$mail','$phone','$gender','$password','$token')";
            $register =  $conn->query($qb_register);
            $gmail = new PHPMailer(true);
            try {
                $gmail->isSMTP();
                $gmail->Host = 'smtp.gmail.com';
                $gmail->SMTPAuth = true;
                $gmail->Username = 'haykarevshatyan64@gmail.com';
                $gmail->Password = 'toqfuczsdlknichu';
                $gmail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
                $gmail->Port = 587;

                $gmail->setFrom('haykarevshatyan64@gmail.com', 'Your Website');
                $gmail->addAddress($mail);
                $gmail->isHTML(true);
                $gmail->Subject = 'Verify your email address';
                $verification_link = "http://" . $_SERVER['HTTP_HOST'] ."/auth/function.php/?mail=$mail&token=$token&action=registerToken";
                $gmail->Body = "
                    <h1>Gmail Verification</h1><br>
                    <p>Click the link:</p>
                    <a href='$verification_link'><button>verify</button></a>
                ";
                $gmail->send();
                
            }
            catch  (Exception $e){
                $gmail->Body = "
                    <h1>Wrong Verification</h1><br>
                ";
                $gmail->send();
            }
            echo json_encode(['success' => true, 'message' => 'you have message in your mail.']);
            exit;
        }
    }
}



// START => VERIFICATION



if(!empty($_GET) && $_GET['action'] == 'registerToken'){
    $token = $_GET['token'];
    $mail = $_GET['mail'];
    $qb_select_token = "SELECT * FROM `user` WHERE `mail` = '$mail'";
    $select_token = $conn->query($qb_select_token);
    if($select_token->num_rows > 0){
        $select_token = $select_token->fetch_assoc();
        $id = $select_token['id'];
        $qb_update_token = "UPDATE `user` SET `status`='1',`token`= null WHERE `id` = '$id'";
        $update_token = $conn->query($qb_update_token);
        header('Location: /pages/account.php');
        exit;
    }else{
        header('Location: /pages/registration.php');
        exit;
    }
}


// START => LOGIN

if(!empty($_POST) && $_POST['action'] == 'login'){
    extract($_POST);
    if(empty($mail) || !preg_match($regex_mail, $mail)){
        $error['mail'] = 'Wrong mail';
    }

    if(strlen($password) < 8 || !preg_match($regex_password, $password)){
        $error['password'] = 'Password is wrong';
    }

    if(empty($error)){
        $qb_log = "SELECT * FROM `user` WHERE `mail` = '$mail' AND `status` = '1'";
        $log = $conn->query($qb_log);
        if($log->num_rows > 0){
            $log = $log->fetch_assoc();
            if (password_verify($password, $log['password'])) {
                $_SESSION['user'] = $log;
                echo json_encode(['success' => true, 'toAccount' => '../pages/account.php']);
                exit;
            }else{
                $error['password'] = 'Wrong password';
                echo json_encode(['success' => false, 'error' => $error]);
                exit;
            }
        }
    }else{
        echo json_encode(['success' => false, 'error' => $error]);
        exit;
    }
}

// START => MAIL FORGOT PASSWORD


if(!empty($_POST) && $_POST['action'] == 'mail'){
    extract($_POST);

    if(empty($mail) || !preg_match($regex_mail, $mail)){
        $error['mail'] = 'Mail is invalid';
    }

    if(empty($error)){
        $qb_mail = "SELECT * FROM `user` WHERE `mail` = '$mail' AND `status` = '1'";
        $user_mail = $conn->query($qb_mail);
        if($user_mail->num_rows > 0){
            $user_mail = $user_mail->fetch_assoc();
            $id = $user_mail['id'];
            $token = md5($user_mail['mail'].time());
            $qb_change_token = "UPDATE `user` SET `token`='$token', `status` = '0' WHERE `id`='$id'";
            $change_token = $conn->query($qb_change_token);
            $gmail = new PHPMailer(true);
            try {
                $gmail->isSMTP();
                $gmail->Host = 'smtp.gmail.com';
                $gmail->SMTPAuth = true;
                $gmail->Username = 'haykarevshatyan64@gmail.com';
                $gmail->Password = 'toqfuczsdlknichu';
                $gmail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
                $gmail->Port = 587;

                $gmail->setFrom('haykarevshatyan64@gmail.com', 'Your Website');
                $gmail->addAddress($mail);
                $gmail->isHTML(true);
                $gmail->Subject = 'Verify your email address';
                $password_verify = "http://" . $_SERVER['HTTP_HOST'] ."/auth/function.php/?mail=$mail&token=$token&action=newPassword";
                $gmail->Body = "
                    <h1>New password Verification</h1><br>
                    <p>Click the button:</p>
                    <a href='$password_verify'><button>verify password</button></a>
                ";
                $gmail->send();
            }
            catch (Exception $e){
                $gmail->Body = "
                    <h1>Wrong Verification</h1><br>
                ";
                $gmail->send();
            }
            echo json_encode(['success' => true, 'message' => 'You have message in your mail.']);
            exit;
        }else{
            $error['mail'] = 'Wrong mail';
            echo json_encode(['success' => false, 'error' => $error]);
            exit;
        }
    }else {
        echo json_encode(['success' => false, 'error' => $error]);
        exit;
    }
}

// START => NEW PASSWORD VERIFICATION

if(!empty($_GET) && $_GET['action'] == 'newPassword'){
    $token = $_GET['token'];
    $mail = $_GET['mail'];
    $_SESSION['mail'] = $mail;
    $qb_select_token = "SELECT * FROM `user` WHERE `mail` = '$mail'";
    $select_token = $conn->query($qb_select_token);
    if($select_token->num_rows > 0){
        $select_token = $select_token->fetch_assoc();
        $id = $select_token['id'];
        $qb_update_token = "UPDATE `user` SET `status`='1',`token`= null WHERE `id` = '$id'";
        $update_token = $conn->query($qb_update_token);
        header('location: /pages/forgotPassword.php');
        exit;
    }
}

// START => NEW PASSWORD

if(!empty($_POST) && $_POST['action'] == 'newPassword'){
    extract($_POST);

    if(strlen($password) < 8 || !preg_match($regex_password, $password)){
        $error['password'] = 'Mail is not valid.';
    }

    if(strlen($repeat_password) < 8 || !preg_match($regex_password, $repeat_password) || $repeat_password != $password){
        $error['repeat_password'] = 'Password is not valid.';
    }
    
    if(empty($error)){
        if(!empty($_SESSION['mail'])){
            $mail = $_SESSION['mail'];
            $qb_select = "SELECT * FROM `user` WHERE `mail` = '$mail'";
            $select = $conn->query($qb_select);
            if($select->num_rows > 0){
                $password = password_hash($password, PASSWORD_DEFAULT);
                $qb_update = "UPDATE `user` SET `password`='$password' WHERE `mail` = '$mail'";
                $update = $conn->query($qb_update);
                echo json_encode(['success' => true, 'backToLog' => '../pages/login.php']);
                exit;
            }
        }
    }else{
        echo json_encode(['success' => false, 'error' => $error]);
        exit;
    }
}
    

// START => ADD PRODUCT

$allowedExtensions = ['jpg', 'jpeg', 'png', 'webp'];

if(!empty($_POST) && $_POST['action'] == 'addProduct'){
    extract($_POST);
    
    if(empty($product_img)){
        $product_img = '../images/istockphoto-931643150-612x612.jpg';
    }else {
        $target_dir = '../images/';
        $product_img = basename($product_img);
        $fileExtension = strtolower(pathinfo($product_img, PATHINFO_EXTENSION));
        $file_path = $_SERVER['DOCUMENT_ROOT']."./images/".$product_img;
        $product_img = $target_dir . $product_img;
        if (!in_array($fileExtension, $allowedExtensions)){
            $error['product_img'] = 'Type is not image';
        }elseif (!file_exists($file_path) && !is_file($file_path)){
            $error['product_img'] = 'There is no image like this in your directorium.';
        }else{
            $fileSizeBytes = filesize($file_path);
            $fileSizeMB = $fileSizeBytes/(1024 * 1024);
            if ($fileSizeMB > 2){
                $error['product_img'] = 'Image size is more then 2 MB.';
            }
        }   
    }

    if(strlen($product_name) < 1){
        $error['product_name'] = 'Product name is empty.';
    }elseif(strlen($product_name) > 100){
        $error['product_name'] = 'Length of product name can not be more then 20.';
    }

    if(strlen($product_price) < 1){
        $error['product_price'] = 'Product price is empty.';
    }elseif (strlen($product_price) > 10) {
        $error['product_price'] = 'Length of product price can not be more then 10.';
    }elseif(!preg_match($regex_price, $product_price)){
        $error['product_price'] = 'Product price is not valid.';
    }

    if(strlen($product_quantity) > 10 && !preg_match($regex_quantity, $product_quantity)){
        $error['product_quantity'] = 'Length of product quantity can not be more then 10 and will include numbers.';
    }

    if(strlen($product_desription) > 255){
        $error['product_desription'] = 'Length of product desription can not be more then 255.';
    }

    $qb_category = "SELECT `category_name` FROM `category` WHERE `id` = '$product_category'";
    $category = $conn->query($qb_category);
    if($category->num_rows > 0){
        $row = $category->fetch_assoc();
        $product_category = $row['category_name'];
    }

    if(empty($error)){
        $product_select = "SELECT * FROM `product` WHERE `product_name` = '$product_name'";
        $product = $conn->query($product_select);
        if($product->num_rows > 0){
            $error['product_name'] = 'You can not add this product.';
            echo json_encode(['success' => false, 'error' => $error]);
            exit;
        }else{
            
            $qb_product = "INSERT INTO `product`(`product_category`, `product_img`, `product_name`, `product_price`, `product_quantity`, `product_description`) VALUES ('$product_category','$product_img','$product_name','$product_price','$product_quantity','$product_desription')";
            $product = $conn->query($qb_product);
            echo json_encode(['success' => true, 'leaveToList' => '../pages/editProduct.php']);
            exit;
        }
    }else{
        echo json_encode(['success' => false, 'error' => $error]);
        exit;
    }
}


// START => EDIT PRODUCT

if(!empty($_POST) && $_POST['action'] == 'editProduct'){
    extract($_POST);
    $product_info = [];
    $qb_select_id = "SELECT * FROM `product` WHERE `product_id` = '$id'";
    $select_id = $conn->query($qb_select_id);
    if($select_id->num_rows > 0){
        $select_id = $select_id->fetch_assoc();
        $category_product = $select_id['product_category'];
        $qb_category = "SELECT `id` FROM `category` WHERE `category_name` = '$category_product'";
        $category = $conn->query($qb_category);
        if($category->num_rows > 0){
            $row = $category->fetch_assoc();
            $row = $row['id'];
        }
        $_SESSION['product_id'] = $select_id['product_id'];
        $_SESSION['old_img'] = $select_id['product_img'];
        $product_info = [
            'product_name' => $select_id['product_name'],
            'product_category' => $row,
            'product_img' => $select_id['product_img'],
            'product_price' => $select_id['product_price'],
            'product_quantity' => $select_id['product_quantity'],
            'product_desription' => $select_id['product_description']
        ];
        $_SESSION['product_edit'] = $product_info;
        echo json_encode(['success' => true, 'editLink' => "../pages/editInputs.php", 'productValues' => $product_info]);
        exit;
    }else {
        echo json_encode(['success' => false, 'error' => 'Empty product.']);
        exit;
    }
}


if(!empty($_POST) && $_POST['action'] == 'deleteProduct'){
    extract($_POST);
    $qb_select_id = "SELECT * FROM `product` WHERE `product_id` = '$id'";
    $select_id = $conn->query($qb_select_id);
    if($select_id->num_rows > 0){
        $qb_delete = "DELETE FROM `product` WHERE `product_id` = '$id'";
        $delete = $conn->query($qb_delete);
        echo json_encode(['success' => true]);
        exit;
    }else{
        echo json_encode(['success' => true, 'error' => 'Empty product.']);
        exit;
    }

}


// START => UPDATE PRODUCT

if(!empty($_POST) && $_POST['action'] == 'updateProduct'){
    extract($_POST);
    if(!empty($product_img)){
        $target_dir = '../images/';
        $product_img = basename($product_img);
        $fileExtension = strtolower(pathinfo($product_img, PATHINFO_EXTENSION));
        $file_path = $_SERVER['DOCUMENT_ROOT']."./images/".$product_img;
        $product_img = $target_dir . $product_img;
        if (!in_array($fileExtension, $allowedExtensions)){
            $error['product_img'] = 'Type is not image';
        }elseif (!file_exists($file_path) && !is_file($file_path)){
            $error['product_img'] = 'There is no image like this in your directorium.';
        }else{
            $fileSizeBytes = filesize($file_path);
            $fileSizeMB = $fileSizeBytes/(1024 * 1024);
            if ($fileSizeMB > 2){
                $error['product_img'] = 'Image size is more then 2 MB.';
            }
        }
    }else {
        $product_img = $_SESSION['old_img'];
    }

    if(strlen($product_name) < 1){
        $error['product_name'] = 'Product name is empty.';
    }elseif(strlen($product_name) > 100){
        $error['product_name'] = 'Length of product name can not be too long.';
    }


    if(strlen($product_price) < 1){
        $error['product_price'] = 'Product price is empty.';
    }elseif (strlen($product_price) > 10) {
        $error['product_price'] = 'Length of product price can not be more then 10.';
    }elseif(!preg_match($regex_price, $product_price)){
        $error['product_price'] = 'Product price is not valid.';
    }

    if(strlen($product_quantity) > 10 && !preg_match($regex_quantity, $product_quantity)){
        $error['product_quantity'] = 'Length of product quantity can not be more then 10 and will include numbers.';
    }

    if(strlen($product_desription) > 255){
        $error['product_desription'] = 'Length of product desription can not be more then 255.';
    }

    $qb_category = "SELECT `category_name` FROM `category` WHERE `id` = '$product_category'";
    $category = $conn->query($qb_category);
    if($category->num_rows > 0){
        $row = $category->fetch_assoc();
        $product_category = $row['category_name'];
    }

    if(empty($error)){
        $product_id = $_SESSION['product_id'];
        $product_select = "SELECT * FROM `product` WHERE `product_id` = '$product_id'";
        $product = $conn->query($product_select);
        if($product->num_rows > 0){
            $qb_product_update = "UPDATE `product` SET `product_category`='$product_category',`product_img`='$product_img',`product_name`='$product_name',`product_price`='$product_price',`product_quantity`='$product_quantity',`product_description`='$product_desription' WHERE `product_id` = '$product_id'";
            $product_update = $conn->query($qb_product_update);
            echo json_encode(['success' => true, 'leaveToList' => '../pages/editProduct.php']);
            exit;
        }
    }else{
        echo json_encode(['success' => false, 'error' => $error]);
        exit;
    }
}

if(!empty($_POST) && $_POST['action'] == 'LogOut'){
    if(!empty($_SESSION['user']) && isset($_SESSION['user'])){
        unset($_SESSION['user']);
        echo json_encode(['success' => true, 'outLink' => '../pages/login.php']);
        exit;
    }
}


?>