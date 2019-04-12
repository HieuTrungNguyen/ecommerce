$('#destroy-product').click(function(event) {
  event.preventDefault();
  self = $(this);
  $.ajax({
    url: self.data('href'),
    method: 'get',
    success: function(res) {
      self.parents('tr').remove();
    }
    error: function() {
      alert(I18n.t('carts.remove_cart.error'));
    }
  });
});

$('.quantity').focusout(function() {
  self = $(this);
  $.ajax({
    url: '/update_hard_cart',
    method: 'put',
    data: {
      id_product: self.data('product'),
      quantity: self.val()
    }
  });
});
