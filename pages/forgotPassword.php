<?php
$title = 'Forgot Password';
require_once $_SERVER['DOCUMENT_ROOT']."./pages/parts/head.php";
?>

<!-- START => FORGOT PASSWORD FORM -->

<div class="register all_center">
    <form class="reg_style">
        <!-- TITLE -->
        <h1 class="form_title">
            New Password
        </h1>
        <!-- PASSWORDS -->
        <div class="reg_items">
            <div class="reg_items password_items">
                <input type="password" placeholder="New password" name="password" class="all_inputs password">
                <svg class="hidden_eye_Password" height="18" role="img" viewBox="0 0 24 24" width="18">
                    <path class="eye_password_1" fill="#ffffff" d="M10 12a2 2 0 1 0 4 0 2 2 0 0 0-4 0m2 5a5 5 0 1 1 0-10 5 5 0 0 1 0 10m0-13.5A12.7 12.7 0 0 0 0 12a12.73 12.73 0 0 0 24 0 12.7 12.7 0 0 0-12-8.5"></path>`
                    <path class="eye_password_2" fill="#ffffff" d="M11.97 17q-1.06 0-2.05-.45l6.6-6.6A4.98 4.98 0 0 1 11.97 17m-5-5a5 5 0 0 1 7.09-4.53l-6.62 6.62A5 5 0 0 1 6.97 12m13.1-5.6L22.5 4A1.75 1.75 0 1 0 20 1.5l-3 3.03A12.73 12.73 0 0 0 0 12a13 13 0 0 0 3.93 5.6L1.5 20A1.75 1.75 0 1 0 4 22.5l3-3.03A12.73 12.73 0 0 0 24 12a13 13 0 0 0-3.93-5.6"></path>
                </svg>
            </div>
            <span class="password_warningMsg message"></span>
            <div class="reg_items password_items">
                <input type="password" placeholder="Repeat Password" name="repeat_password" class="all_inputs repeat_password">
                <svg class="hidden_eye_Password" height="18" role="img" viewBox="0 0 24 24" width="18">
                    <path class="eye_password_1" fill="#ffffff" d="M10 12a2 2 0 1 0 4 0 2 2 0 0 0-4 0m2 5a5 5 0 1 1 0-10 5 5 0 0 1 0 10m0-13.5A12.7 12.7 0 0 0 0 12a12.73 12.73 0 0 0 24 0 12.7 12.7 0 0 0-12-8.5"></path>`
                    <path class="eye_password_2" fill="#ffffff" d="M11.97 17q-1.06 0-2.05-.45l6.6-6.6A4.98 4.98 0 0 1 11.97 17m-5-5a5 5 0 0 1 7.09-4.53l-6.62 6.62A5 5 0 0 1 6.97 12m13.1-5.6L22.5 4A1.75 1.75 0 1 0 20 1.5l-3 3.03A12.73 12.73 0 0 0 0 12a13 13 0 0 0 3.93 5.6L1.5 20A1.75 1.75 0 1 0 4 22.5l3-3.03A12.73 12.73 0 0 0 24 12a13 13 0 0 0-3.93-5.6"></path>
                </svg>
            </div>
            <span class="repeat_password_warningMsg message"></span>
        </div>
        <!-- SUBMIT BUTTON -->
        <div class="reg_submit">
            <span class="submit_parts toLogin all_center">
                <a href="./login.php">Back</a>
            </span>
            <span class="submit_parts btn_submit">
                <button type="button" class="submit forgotPassword_btn">Change password</button>
            </span>
        </div>
    </form>
</div>

<?php
require_once $_SERVER['DOCUMENT_ROOT']."./pages/parts/footer.php";
?>