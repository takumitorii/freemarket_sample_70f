$(function(){
  $('#price_calc').on('input', function(){
    var data = $('#price_calc').val();
    var profit = Math.round(data * 0.9)
    var fee = (data - profit)
    $('.total_price').html(fee)
    $('.total_price').prepend('¥')
    $('.total_profit').html(profit)
    $('.total_profit').prepend('¥')
    $('#price').val(profit)
    if(profit == '') {
    $('.right_bar_2').html('ー');
    $('.total_price').html('ー');
    }
  })
})