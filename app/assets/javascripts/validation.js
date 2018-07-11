$(document).ready(function () {
    var parsleyConfig = {
        errorsContainer: function (parsleyField) {
            return parsleyField.$element.closest('.form-group');
        },
        requiredMessage: "This field is required"
    };

    $("form").parsley(parsleyConfig);

    var oneTime = 0;

    window.Parsley.on('form:error', function () {
        if (oneTime == 0) {
            oneTime = 1;
            addFlashMessage('Please complete highlighted areas', 'alert-danger');
            $('html, body').animate({
                scrollTop: 0
            }, 3000);
        }
    });
});