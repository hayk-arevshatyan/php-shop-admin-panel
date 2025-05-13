<?php
require_once "./parts/head.php";
?>

<!-- START => UPDATE PROFILE -->


<section class="add_product_form">
    <form class="product_form">
        <!-- TITLE -->
        <h1 class='edit_product_title'>Edit product</h1>

        <!-- USER MAIL -->
        <div class="input_items">
            <input type="number" placeholder='Price' min='0' name='Product price' class="edit_product_price product_inputs">
            <span class="product_price_message message"></span>
        </div>
        <!-- USER PASSWORD -->
        <div class="input_items">
            <input type="number" placeholder='Product quantity' min='0' name='Product quantity' class="edit_product_quantity">
            <span class="product_quantity_message message"></span>
        </div>
        <!-- PRODUCT DESCRIPTION -->
        <div class="input_items">
            <textarea type="text" placeholder='Description' name='Product description' class="all_textareas edit_product_desription"></textarea>
            <span class="product_desription_message message"></span>
        </div>
        <div class="products_btn_conteiner">
            <button class='close_editBtn'>
                <a href="./editProduct.php">Back</a>
            </button>
            <button class='update_product product_form_btn' type="button">Edit</button>
        </div>
    </form>
</section>




<?php
require_once "./parts/head.php";
?>