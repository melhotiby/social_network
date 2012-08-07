$(function () {
    $('#fileupload').fileupload({
        dataType: 'json',
        url: create_url,
        done: function (e, data) {
            $.each(data.result, function (index, file) {
              console.log(file);
              var picture = '<div id="image' + file.id + '" class="painting">';
              picture += '<img src="'+file.thumbnail_url+'">';
              picture += '<div class="actions">';
              picture += '<a href="/users/' + file.user_id + '/photos/' + file.id + '" data-remote="true" data-method="delete" rel="nofollow">remove</a>';
              picture += '</div></div>';
              $('#thumbs').append(picture);
            });
        }
    });
});
