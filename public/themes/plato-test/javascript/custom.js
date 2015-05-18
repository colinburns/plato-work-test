jQuery.noConflict();

(function($) {
	$(document).ready(function() {
        $("#Form_ContactForm").validate({
            submitHandler: function(form) {
                var form = $('#Form_ContactForm');
                $.ajax( {
                    type: "POST",
                    url: form.attr('action'),
                    data: form.serialize(),
                    success: function( response ) {
                        var response = JSON && JSON.parse(response) || $.parseJSON(response);
                        $("#Form_ContactForm").fadeOut('slow');
                        var responseHTML = "<p class=\"html-response\"><img src=\""+response.beverage+"\" class=\"beverage\" />"+response.message+"</p>";
                        $("#result").html(responseHTML);
                    },
                    error: function ( response ) {
                        var response = JSON && JSON.parse(response) || $.parseJSON(response);
                        $("#Form_ContactForm").fadeOut('slow');
                        var responseHTML = "<p class=\"html-response error\">"+response.message+"</p>";
                        $("#result").html(responseHTML);
                    }
                });

                return false;

            }
        });
    });
}(jQuery));