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
      alert('can not delete this item');
    }
  });
});
