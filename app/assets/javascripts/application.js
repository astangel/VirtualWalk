// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$('.small-img').wrap('<div style="position:relative; overflow:visible;" />');
$('.small-img').mouseover(function(){$(this).before($('<img/>').attr({'src':$(this).attr('src'),'class':'rollover-img'}).css({'z-index':'10', 'position':'absolute', 'top':$(this).height()/2, 'left':$(this).width()/2}).load(function(){$(this).css({'left':"+="+(-1*(this.width/2)),'top':"+="+(-1*(this.height/2))});}));$('.rollover-img').mouseout(function(){$(this).hide();});});