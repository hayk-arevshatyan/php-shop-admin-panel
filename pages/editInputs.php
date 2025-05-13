<?php
$title = 'My Account';
require_once $_SERVER['DOCUMENT_ROOT']."./pages/parts/head.php";
require_once $_SERVER['DOCUMENT_ROOT']."./pages/parts/dashboard.php";
?>

<!-- START => MY ACCOUNT -->


<!-- START => ADD PRODUCT -->

<section class="add_product_form">
    <form class="product_form">
        <!-- TITLE -->
        <h1 class='edit_product_title'>Edit product</h1>

        <!-- PRODUCT IMAGE -->
        <div class="input_items">
            <div class="imageButtonConteiner">
                <img src="" class='edit_product_img'>
                <input type="file" name='Product image' accept="image/*" class="get_img_value" >
            </div>
            <span class="product_img_message message"></span>
        </div>

        <!-- PRODUCT NAME -->
        <div class="input_items">
            <input type="text" placeholder='Product name' name='Product name' class="edit_product_name product_inputs">
            <span class="product_name_message message"></span>
        </div>
        <!-- PRODUCT CATEGORY -->
        <div class="input_items">
            <select name='Product category' class="edit_product_category">
                <?php
                require_once '../auth/db.php';
                $qb_category = "SELECT * FROM `category`";
                $category = $conn->query($qb_category);
                if($category->num_rows > 0){
                    foreach ($category as $index) {
                ?>        
                    <option value="<?php echo $index['id'];?>"><?php echo $index['category_name'];?></option>
                <?php
                    }
                }
                ?>
            </select>
            <span class="product_category_message message"></span>
        </div>
        <!-- PRODUCT PRICE -->
        <div class="input_items">
            <input type="number" placeholder='Price' min='0' name='Product price' class="edit_product_price product_inputs">
            <span class="product_price_message message"></span>
        </div>
        <!-- PRODUCT QUANTITY -->
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
require_once $_SERVER['DOCUMENT_ROOT']."./pages/parts/footer.php";
?>