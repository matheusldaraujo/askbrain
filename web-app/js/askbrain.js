/**
 * Created by matheus on 20/04/14.
 */
$(document).ready(function () {
    //Make navbar dynamic highlight
    $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
});