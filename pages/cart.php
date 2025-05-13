<?php
$title = 'My Cart';
require_once './parts/head.php';
require_once './parts/dashboard.php';
?>

<!-- START => CART SECTION -->

<div class="card">
    <div class="card-content">
        <p class="card-heading">Remove from cart?</p>
        <p class="card-description">Lorem ipsum dolor sit amet, consectetur adi</p>
    </div>
    <div class="card-button-wrapper">
        <button class="card-button secondary close_model">Cancel</button>
        <button class="card-button primary close_model delete_custom">Delete</button>
    </div>
</div>


<section class="cart_section">
    <h2>Product Table</h2>
    <table>
        <thead>
            <tr>
                <th>Image</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Unit Price</th>
                <th>Subtotal</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><img src="product1.jpg" alt="Product 1"></td>
                <td>Product 1 Name</td>
                <td><input type="number" value="1" min="1" style="width: 50px;"></td>
                <td>$19.99</td>
                <td>$19.99</td>
                <td><button class='remove_from_cart'>Remove</button></td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td class="total">Total</td>
                <td class="total">$119.96</td>
            </tr>
        </tfoot>
    </table>
</section>

<?php
require_once './parts/footer.php';
?>