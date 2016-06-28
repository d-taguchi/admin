// ページ読み込み処理
// $(window).load だと遅い…
$(function() {
    $('.loader-bg').delay(900).fadeOut(800);
    $('.loader').delay(600).fadeOut(300);
});
