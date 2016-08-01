// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize
//= require_tree .

//= does not automatically refresh page when voting
$(document).ready(function() {
  $('.upvote').on('click', function() {
    var count = $(this).attr('.upvote').parent.find('.counter');
    console.log(count.text(parseInt('votes_count') + 1));
  });
});

$(document).ready(function() {
  $('.downvote').on('click', function() {
    var count = $(this).parent().find('.counter')
    console.log(count.text(parseInt('votes_count') - 1));
  });
});

var highlight = function() {
  $(this).addClass('highlight').on('mouseenter');
}

var nolight = function() {
  $(this).removeClass('highlight').on('mouseleave');
}
// = button on board show page that highlights top link when clicked
