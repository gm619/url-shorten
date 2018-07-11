const addFlashMessage = function (message, type) {
    const flash_message_delay = 10000;
    type = type || 'alert-info';
    $flashMessages = $('.flash-messages-for-ajax');

    $flashMessages.stop();
    $flashMessages.hide();
    $flashMessages.html(
        '<div class="alert alert-fixed ' + type + '">' +
        '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>' +
        '<p class="text-center">' + message + '</p>' +
        '</div>'
    );
    $flashMessages.fadeIn();
    $flashMessages.delay(flash_message_delay).fadeOut();

};
