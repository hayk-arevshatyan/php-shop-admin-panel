<?php
$title = 'Mail verification';
require_once $_SERVER['DOCUMENT_ROOT']."./pages/parts/head.php";
?>

<!-- START => MAIL FORM -->

<div class="register all_center">
    <form class="all_center reg_style">
        <!-- TITLE -->
        <h1 class="form_title">
            Your Mail
        </h1>
        <!-- MAIL -->
        <div class="reg_items">
            <input type="email" placeholder="Email" name="mail" class="all_inputs mail">
            <span class="mail_message message"></span>
        </div>
        <div class="reg_submit">
            <span class="submit_parts toLogin all_center">
                <a href="./login.php">Back</a>
            </span>
            <span class="submit_parts btn_submit">
                <button type="button" class="submit forgotPassMail_btn">Next</button>
            </span>
        </div>
    </form>
</div>

<?php
require_once $_SERVER['DOCUMENT_ROOT']."./pages/parts/footer.php";
?>