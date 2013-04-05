function iso()
{
  $('#container').isotope({
    itemSelector : '.isotope-item',
    layoutMode : 'fitRows'
  });
}

var url = "https://api.instagram.com/v1/tags/nyc/media/recent?callback=?&client_id=28c13547ca294f84a89bef117f26b5b8";

// $(document).ready(insta);

function insta()
{
  $.getJSON(url, showPhotos);
}

function showPhotos(photos){
  var photos_html = '';

  $.each(photos.data, function(index, photo){
    photos_html += displayPhoto(photo);
  });

  $('#container').isotope({
  // options
    itemSelector : '.isotope-item',
    layoutMode : 'fitRows'
  });

}

function displayPhoto(photo){
    photo = {
      img_id: photo.id,
      author_name: photo.user.username,
      instagram_link: photo.link,
      created_time: photo.created_time,
      thumb: photo.images.thumbnail.url,
      low_res: photo.images.low_resolution.url,
      standard_res: photo.images.standard_resolution.url
    };
    $('#container').append('<img class="isotope-item" src='+photo.standard_res+' width="250" height="250" />');
  }