function update_ckeditors(){
    for (k in CKEDITOR.instances) {
        var v = CKEDITOR.instances[k]
        if (typeof v.updateElement == 'function') {
            v.updateElement()
        }
    }
}

window.attachments_drop_zone = null
$(document).ready(function () {

    // if index action
    $('.footable').footable();

    // if another action

    Dropzone.autoDiscover = false;
    $("#wizard").steps();
    var $form = $(".wizard-form")
    $form.steps({
        enableAllSteps: $form.attr("form_role") == "edit",
        bodyTag: "fieldset",
        onStepChanging: function (event, currentIndex, newIndex) {
            // Always allow going backward even if the current step contains invalid fields!
            if (currentIndex > newIndex) {
                return true;
            }

            // Forbid suppressing "Warning" step if the user is to young
            if (newIndex === 3 && Number($("#age").val()) < 18) {
                return false;
            }

            var form = $(this);

            // Clean up if user went backward before
            if (currentIndex < newIndex) {
                // To remove error styles
                $(".body:eq(" + newIndex + ") label.error", form).remove();
                $(".body:eq(" + newIndex + ") .error", form).removeClass("error");
            }

            // Disable validation on fields that are disabled or hidden.
            form.validate().settings.ignore = ":disabled,:hidden";

            // Start validation; Prevent going forward if false
            return form.valid();
        },
        onStepChanged: function (event, currentIndex, priorIndex) {
            // Suppress (skip) "Warning" step if the user is old enough.
            if (currentIndex === 2 && Number($("#age").val()) >= 18) {
                $(this).steps("next");
            }

            // Suppress (skip) "Warning" step if the user is old enough and wants to the previous step.
            if (currentIndex === 2 && priorIndex === 3) {
                $(this).steps("previous");
            }

            if (currentIndex == 1) {
                var $form = $('.wizard-form')

                if ($form.attr("form_role") == 'new') {
                    var url = $form.attr("action") + ".json"

                    var url_parts = url.split("/").filter(function (v) {
                        return !!v.length
                    }).join(", ")



                    update_ckeditors()

                    var data = { }
                    var resource_name = $form.attr("data-resource-name")
                    //data[resource_name] =  $form.serializeArray()
                    data = $form.serializeArray()


                    console.log("data:", data)

                    $.ajax({
                        url: url,
                        type: "post",
                        dataType: "json",
                        data: data,
                        success: function (data) {
                            $form.attr("data-resource-id", data.id)
                            $form.attr("form_role", "temp")
                            var update_url = "/" + $form.attr("data-resources-name") + "/" + data.id
                            $form.attr("data-update-url", update_url)
                            window.attachments_drop_zone.options.url = update_url + "/assets.json"
                        }
                    })
                }
            }
        },
        onFinishing: function (event, currentIndex) {
            var form = $(this);

            // Disable validation on fields that are disabled.
            // At this point it's recommended to do an overall check (mean ignoring only disabled fields)
            form.validate().settings.ignore = ":disabled";

            // Start validation; Prevent form submission if false
            return form.valid();
        },
        onFinished: function (event, currentIndex) {
            var $form = $(this);

            // Submit form input
            var url = ($form.attr("data-update-url") || $form.attr("action")) + ".json"
            var type = "put"

            //if(1 == 1){
            update_ckeditors()
            //}



            var data = $form.serializeArray()

            var form_role = $form.attr("form_role")

            if (form_role != 'new' && form_role != 'temp' && form_role != 'edit' ) {

                /*
                 success: function (data) {
                 if ($form.attr("form_role") == 'new') {
                 window.location.pathname = window.location.pathname.replace("/new", "/" + data.id + "/edit")
                 }
                 */


                $form.ajaxSubmit({
                    url: url,
                    type: type
                })
            }
            else {
                $form.submit();
            }


        }
    }).validate({
        errorPlacement: function (error, element) {
            element.before(error);
        },
        rules: {
            confirm: {
                equalTo: "#password"
            }
        }
    });

    /*$("div.attachments-dropzone").dropzone({url: function(){
     var $dz = $(this)
     var $form = $dz.closest("form")
     return $form.attr("data-update-url")+"/assets"

     }})*/
    //new Dropzone("div.attachments-dropzone", {url: '#{"/#{resources_name}/#{@resource.id || 'new' }/assets"}'})
    var $dz = $("div.attachments-dropzone")
    if ($dz.length) {
        var $form = $dz.closest("form")
        var base_url = $dz.attr("action") || $form.attr("action") + "/assets"
        //var dropzone_url =

        window.attachments_drop_zone = new Dropzone("div.attachments-dropzone", {
            url: base_url + ".json",
            addRemoveLinks: true,
            clickable: true,
            success: function (file, response_object) {
                console.log("success: ", arguments)
                file.id = response_object.id
            },
            //addedfile: function(){
            //  console.log("addedfile", arguments)
            //},
            removedfile: function (file) {


                //var name = file.name;
                $.ajax({
                    type: 'delete',
                    url: base_url + "/" + file.id + ".json",
                    dataType: 'json',
                    success: function () {
                        var _ref;

                        var id = file.id
                        var dz = window.attachments_drop_zone
                        var index = dz.files.indexOf(function (f) {
                            return f.id == id
                        })
                        if (index >= 0) {
                            dz.files.splice(index, 1);
                            (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
                        }
                        else {
                            console.log("index", index)
                        }
                    }
                });
                //var _ref;


                return true
            },
            init: function () {
                var dz = this;


            }

        })

        if ($form.attr("form_role") != 'new') {


            $.ajax(
                {
                    dataType: "json",
                    type: "get",
                    url: $form.attr('action') + "/assets.json",
                    success: function (data) {
                        var files = data
                        var dz = window.attachments_drop_zone
                        for (var i = 0; i < files.length; i++) {
                            var file = files[i]
                            var f = {name: file.url, size: file.data_file_size, id: file.id}
                            console.log("f", f)
                            //dz.addFile.call(dz, f);


                            dz.files.push(f)
                            dz.options.addedfile.call(dz, f);
                            dz.options.thumbnail.call(dz, f, file.thumb_url);
                            dz.options.complete.call(dz, f)

                        }
                    }
                }
            )
        }
    }

    var $dz = $(".attachments-dropzone")
    $dz.bind("mousedown", function (e) {
        e.metaKey = true;
    }).xselectable()


    $(".filemanager-toolbar").on("click", ".tool", function(e){
        var dz = window.attachments_drop_zone
        var files = $.map($dz.children().filter(".xselectable-selected"), function(item){var i = $(item).index() - $dz.find(">.dz-message").length; return dz.files[i]})
        console.log("indexes", files)

        var $tool = $(this)

        if($tool.hasClass("delete")) {
            for (var i = 0; i < files.length; i++) {
                var file = files[i]
                dz.options.removedfile.call(dz, file)
            }
        }
        else if($tool.hasClass("mark-for-avatar")){
            $.ajax({})
        }
    })



    // Comments
    $("form#new_comment").on("submit", function(event){
        event.preventDefault()
        var $form = $(this)
        $form.validate()
        var $html = $("#html")
        var author = {full_name: $html.attr("data-user-fullname"), profile_url: $html.attr("data-user-profile-url")}

        if ($form.valid()){

            var comment_text = $form.find('textarea').val()
            var comment_title = (text = $form.find("input:text").val()).length ? text : false
            var $comments_container = $(".comments")
            var comment_html = "" +
                "<div class='media comment'>" +
                    "<a class='forum-avatar' href='#'>" +
                        "<img class='img-circle' src=''/>" +
                        "<div class='author-info'></div> " + "</a>" +
                    "<div class='media-body'>" +
                        "<div class='title-and-text-container'>" +
                            ( comment_title ? "<h4 class='media-heading'>" + comment_title + "</h4>" : "") +
                            "<div class='comment-text'>" +
                                comment_text +
                            "</div>" +
                        "</div>" +
                        "<div class='comment-author'>" +
                            "<a href='" + author.profile_url + "'>" + author.full_name + "</a>"
                        "</div>" +
                    "</div>" +
                    "<div class='clearfix'></div>" +
                "</div>"

            var $comment = $(comment_html)
            $comments_container.append($comment)

            $form.ajaxSubmit({url: $form.attr("action")+".json"})

            $form.resetForm()


        }
    })

});



$(document).on("ready", function(){
    $(".flash-notice").fadeOut(500)
})
