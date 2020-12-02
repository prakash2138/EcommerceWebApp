$('.carousel').carousel({
    interval: 2000
});

//
//function add_to_cart(){
//    alert("this is big");
//    
//}

function add_to_cart(pid, pname, price) {
    let cart = localStorage.getItem("cart");
    if (cart === null) {
        //no cart yet
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        showToast("Product is added to the cart");
    } else {
//        cart is already present

        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId === pid);
        if (oldProduct) {
            //we have to increase the product quantity only
            oldProduct.productQuantity = oldProduct.productQuantity + 1;
            pcart.map((item) => {
                if (item.productId === oldProduct.productId) {
                    item.productQuantity = oldProduct.productQuantity;
                }
            });
            localStorage.setItem("cart", JSON.stringify(pcart));
            showToast(oldProduct.productName + "'s quatity is increased by " + oldProduct.productQuantity);
        } else {
            //we have to add another product
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            showToast("Product is added to the cart");
        }
    }

    updateCart();
}

//update cart
function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);

    if (cart === null || cart.length === 0) {
        console.log("Cart is empty !!");
        $(".cart-item").html("( 0 )");
        $(".cart-body").html("<h3>Cart does not have any item</h3>");
        $(".checkout-btn").attr('disabled', true);
    } else {
        //there is something in cart
        console.log(cart);
        $(".cart-item").html(`(${cart.length})`);
        let table = `
                   <table class="table">
  <thead>
    <tr>
      <th scope="col">Item Name</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
       <th scope="col">Total Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  
`;
        let totalPrice = 0;
        cart.map((item) => {
            table += `
                        <tbody>
                                <tr>
                                    <td>${item.productName}</td>
                                    <td>Rs. ${item.productPrice}</td>
                                    <td>${item.productQuantity}</td>
                                    <td>${item.productQuantity * item.productPrice}</td>
                                    <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
                                </tr>

                         </tbody>

`;
            totalPrice += item.productPrice * item.productQuantity;
        });

        table = table + `
            <tr><td colspan='5' class='font-weight-bold text-right m-5'>Total Price : Rs ${totalPrice}</td></tr<
</table>`;
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled', false);
    }
}

//delete item from cart
function deleteItemFromCart(pid) {
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item) => item.productId !== pid);
    localStorage.setItem('cart', JSON.stringify(newcart));
    updateCart();
    showToast("Item is removed from the cart");
}



$(document).ready(function () {
    updateCart();
});

//to show toast
function showToast(value) {
    $("#toast").addClass("display");
    $("#toast").html(value);

    setTimeout(() => {
        $("#toast").removeClass("display");
    }, 2000)
}

//go to checkout link 
function goToCheckout(){
    window.location="checkout.jsp";
}