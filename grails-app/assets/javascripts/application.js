// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.2.0.min
//= require bootstrap
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
    (function ($) {
        $(document).ajaxStart(function () {
            $('#spinner').fadeIn();
        }).ajaxStop(function () {
            $('#spinner').fadeOut();
        });
    })(jQuery);
}


$(document).ready(function () {


    $("#updateProfile").click(function (e) {
        var form = $("#UpdateProfileForm").serialize();

        $.ajax({
            type: "POST",
            url: "/user/changePassword",
            data: form,
            success: function (response) {
                alert(response.message);

            }
            , error: function (e) {
                alert("Error");
            }
        });

    });


    $("#topicSaveButton").click(function (e) {
        var form = $("#saveTopic").serialize();

        $.ajax({
            type: "GET",
            url: "/grails-app/topic/save",
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    $("#topic-" + id).remove();
                    alert(response.success)
                } else {
                    alert(response.error)
                }

            }, error: function (e) {
                alert("Error");
            }
        });

    });


    $(document).ready(function () {
        $(".topicdelete").click(function (e) {
            var id = $(this).attr('id');
            $.ajax({
                type: "GET",
                url: "/topic/delete",
                data: {id: id},
                contentType: "application/json",
                success: function (response) {
                    if (response.success) {
                        $("#topic-" + id).remove();
                        alert(response.success)
                    } else {
                        alert(response.error)
                    }
                }, error: function (e) {
                    alert("Error");
                }
            });

        });

    });
});


