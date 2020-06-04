function callNotificationWindow() {
    if (confirm("Вызвать окно оповещения?")) {
        return true;
    } else {
        return false;
    }
}

function callConfirmationWindow(){
    if (confirm("Вызвать окно подтверждения?")) {
        return true;
    } else {
        return false;
    }
}