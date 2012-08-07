$(function () {
    $('#fileupload').fileupload({
        dataType: 'json',
        url: create_url,
        done: function (e, data) {
            $.each(data.result, function (index, file) {
               $('<li><img src="'+file.thumbnail_url+'"></li>').appendTo('#thumbs');
            });
        }
    });
});
