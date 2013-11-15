// part 4 attempt



$(document).ready(function() {


  $('#created_event').on('submit', function(event) {
    event.preventDefault();
    var url=$(this).attr('action');
    var data=$(this).serialize();
    $.post(url, data, function(response) {
      $("#created_event").append(response);

    // game.render();
  );
 });
});