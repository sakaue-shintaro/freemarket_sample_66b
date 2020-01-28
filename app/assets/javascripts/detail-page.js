$(function() {
  //クリックしたときのファンクションをまとめて指定
  $('.product-box__main-content__photo__sub-photo__list li').click(function() {
  //.index()を使いクリックされたタブが何番目かを調べ、
  //indexという変数に代入します。
        var index = $('.product-box__main-content__photo__sub-photo__list li').index(this);
    //コンテンツを一度すべて非表示にし、
      $('.product-box__main-content__photo__main-photo li').css('display','none');
    //クリックされたタブと同じ順番のコンテンツを表示します。
    $('.product-box__main-content__photo__main-photo li').eq(index).css('display','block');
    //一度タブについているクラスselectを消し、
    $('.product-box__main-content__photo__sub-photo__list li').removeClass('select');
    //クリックされたタブのみにクラスselectをつけます。
    $(this).addClass('select')
  });
});
