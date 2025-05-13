<?php
$title = 'My Account';
require_once $_SERVER['DOCUMENT_ROOT']."./pages/parts/head.php";
require_once $_SERVER['DOCUMENT_ROOT']."./pages/parts/dashboard.php";
?>



<!-- START => ADD PRODUCT -->

<section class="add_product_form">
    <form class="product_form">
        <!-- TITLE -->
        <h1 class='edit_product_title'>Add product</h1>

        <!-- PRODUCT IMAGE -->
        <div class="input_items">
            <div class="imageButtonConteiner">
                <img src="../images/istockphoto-931643150-612x612.jpg" class='product_img'>
                <input type="file" name='Product image' accept="image/*" class="get_img_value" >
            </div>
            <span class="product_img_message message"></span>
        </div>

        <!-- PRODUCT NAME -->
        <div class="input_items">
            <input type="text" placeholder='Product name' name='Product name' class="product_name product_inputs">
            <span class="product_name_message message"></span>
        </div>
        <!-- PRODUCT CATEGORY -->
        <div class="input_items">
            <select name='Product category' class="product_category">
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
            <input type="number" placeholder='Price' min='0' name='Product price' class="product_price product_inputs">
            <span class="product_price_message message"></span>
        </div>
        <!-- PRODUCT QUANTITY -->
        <div class="input_items">
            <input type="number" placeholder='Product quantity' min='0' name='Product quantity' class="product_quantity">
            <span class="product_quantity_message message"></span>
        </div>
        <!-- PRODUCT DESCRIPTION -->
        <div class="input_items">
            <textarea type="text" placeholder='Description' name='Product description' class="all_textareas product_desription"></textarea>
            <span class="product_desription_message message"></span>
        </div>
        <div class="products_btn_conteiner">
            <button class='add_btn product_form_btn' type="button">Add</button>
        </div>
    </form>
</section>


<?php
require_once $_SERVER['DOCUMENT_ROOT']."./pages/parts/footer.php";
?>