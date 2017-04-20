
$(document).ready(function(){

//Debut fixe nav bar
//$('#nav').addClass("nav-bar");
var positionElementInPage=$('#nav').scrollTop()+85;
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
    }
);
//Fin fixe nav bar



});
