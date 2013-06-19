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
$(document).ready(function(){
  $('.small-img').load(function(){$(this).before($('<img/>').attr({'src':$(this).attr('src'),'class':'rollover-img','id':''+$(this).attr('src').replace(/[/:.]/g,'')+'_large'}).css({'display':'none','z-index':'10', 'position':'absolute', 'background-color':'#FFF', 'top':$(this).height()/2, 'left':-$(this).width()/8}).load(function(){$(this).css({'top':"+="+(-1*(this.height/2))});}));$('.rollover-img').mouseout(function(){$(this).hide();});});
  $('.small-img').wrap('<div style="position:relative; overflow:visible;" />');
  $('.small-img').mouseover(function(){$i=$('#'+$(this).attr('src').replace(/[/:.]/g,'')+'_large').show();
  
  /*alert($i.width());*/
  $i.css({'top':-$i.height()/2, 'left':-$i.width()/8});
  });
  $('.registerCheck').click(function(){window.location = $(this).attr('regLink');});
});