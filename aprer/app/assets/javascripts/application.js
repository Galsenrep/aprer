// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require ckeditor/init
//= require turbolinks
//= require_tree .



$(document).ready(function(){

//Debut fixe nav bar
//$('#nav').addClass("nav-bar");
var positionElementInPage=$('#nav').scrollTop()+108;
var positionSidebar=$('#side-bar').scrollTop()+117;

$(window).scroll(
    function() {
        if ($(window).scrollTop()>=positionElementInPage) {
            // fixed
            $('#nav').addClass("navbar-fixed-top");
        $('#nav').addClass("nav-bar");

        } else {
            // relative
            $('#nav').removeClass("navbar-fixed-top");
      $('#nav').removeClass("nav-bar");
        }
//sidebar
  if($(window).width()>768){
        if ($(window).scrollTop()>=positionSidebar) {
            // fixed
            $("#side-bar").css({'position':'fixed','margin-top':'-52px'});
            //$("#side-bar").removecss({'position':'initial'});


        } else {
            // relative
            $("#side-bar").css({'position':'initial','margin-top':'-20px'});
            //$("#side-bar").removecss({'position':'fixed'});

        }
    }
  }
);
//Fin fixe nav bar


});
