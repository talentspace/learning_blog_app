$(document).ready(function(){

  $('form#new_comment').submit(function(){
    var valuesToSubmit = $(this).serialize();

    $.ajax({
        type: "POST",
        url: $(this).attr('action'),
        data: valuesToSubmit,
        dataType: "JSON"
    }).success(function(data){
        $('.comments').prepend('<p>' + $('form#new_comment').
        find('textarea#comment_body').val() + '</p>')

        $('form#new_comment').find('textarea#comment_body').val('');

    });
    return false;
  });
});
