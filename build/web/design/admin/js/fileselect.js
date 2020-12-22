// function readURL(input) {
//     if (input.files && input.files[0]) {
//
//         var reader = new FileReader();
//
//         reader.onload = function (e) {
//             $('.image-upload-wrap').hide();
//
//             $('.file-upload-image').attr('src', e.target.result);
//             $('.file-upload-content').show();
//
//             $('.image-title').html(input.files[0].name);
//         };
//
//         reader.readAsDataURL(input.files[0]);
//
//     } else {
//         removeUpload();
//     }
// }
//
// function removeUpload() {
//     $('.file-upload-input').replaceWith($('.file-upload-input').clone());
//     $('.file-upload-content').hide();
//     $('.image-upload-wrap').show();
// }
//
// $('.image-upload-wrap').bind('dragover', function () {
//     $('.image-upload-wrap').addClass('image-dropping');
// });
// $('.image-upload-wrap').bind('dragleave', function () {
//     $('.image-upload-wrap').removeClass('image-dropping');
// });

$(document).on('click', '#close-preview', function(){
    $('.image-preview').popover('hide');
    // Hover before close the preview
    $('.image-preview').hover(
        function () {
            $('.image-preview').popover('show');
        },
        function () {
            $('.image-preview').popover('hide');
        }
    );
});

$(function() {
    // Create the close button
    var closebtn = $('<button/>', {
        type:"button",
        text: 'x',
        id: 'close-preview',
        style: 'font-size: initial;',
    });
    closebtn.attr("class","close pull-right");
    // Set the popover default content
    $('.image-preview').popover({
        trigger:'manual',
        html:true,
        title: "<strong>Xem trước</strong>"+$(closebtn)[0].outerHTML,
        content: "Không có hình",
        placement:'bottom'
    });
    // Clear event
    $('.image-preview-clear').click(function(){
        $('.image-preview').attr("data-content","").popover('hide');
        $('.image-preview-filename').val("");
        $('.image-preview-clear').hide();
        $('.image-preview-input input:file').val("");
        $(".image-preview-input-title").text("Tìm");
    });
    // Create the preview image
    $(".image-preview-input input:file").change(function (){
        var img = $('<img/>', {
            id: 'dynamic',
            width:250,
            height:200
        });
        var file = this.files[0];
        var reader = new FileReader();
        // Set preview image into the popover data-content
        reader.onload = function (e) {
            $(".image-preview-input-title").text("Đổi ảnh");
            $(".image-preview-clear").show();
            $(".image-preview-filename").val(file.name);
            img.attr('src', e.target.result);
            $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
        }
        reader.readAsDataURL(file);
    });
});