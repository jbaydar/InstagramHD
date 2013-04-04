var timer;
var photos;
var index;

function search_insta()
{
  $.getJSON('https://api.instagram.com/v1/tags/nyc/media/recent?client_id=8084b02430514d3da588b2eadb44add0&callback=callbackFunction', insta_finished);
}

function insta_finished(data)
{
  index = 0;
  photos = data.images.thumbnail.url;
  timer = setInterval(display_photo, 50);
}

function display_photo()
{
  var photo = photos[index];
  while (index < 10)
  {
    $('#container').append('.item'+'\n'+'  =image_tag "'+standard_res+'"');
    index++;
  }
}
// img_id = data.id
// author_name = data.user.username
// instagram_link = data.link
// created_time= data.created_time
// thumb = data.images.thumbnail.url
// low_res = data.images.low_resolution.url
// standard_res = data.images.standard_resolution.url


// $('#container').isotope({
//   layoutMode: 'cellsByColumn',
//   cellsByRow: {
//     columnWidth: 240,
//     rowHeight: 360
//   }
// });