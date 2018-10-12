
//calculate price//
/* Set rates + misc */
var fadeTime = 100;
/* Assign actions */
$('.product-quantity input').change(function () {
    updateQuantity(this);
});

/* Recalculate cart */
function recalculateCart()
{
    var subtotal = 0;
    /* Sum up row totals */
    $('.product').each(function () {
        subtotal += parseFloat($(this).children('.product-line-price').text());
    });


    /* Update totals display */
    $('.totals-value').fadeOut(fadeTime, function () {
        $('#cart-subtotal').html(subtotal.toFixed(1));
    });
}
/* Update quantity */
function updateQuantity(quantityInput)
{
    /* Calculate line price */
    var productRow = $(quantityInput).parent().parent();
    var quantity = $(quantityInput).val();
    var linePrice = 120 * quantity;

    /* Update line price display and recalc cart totals */
    productRow.children('.product-line-price').each(function () {
        $(this).fadeOut(fadeTime, function () {
            $(this).text(linePrice.toFixed(1));
            recalculateCart();
            $(this).fadeIn(fadeTime);
        });
    });
}
