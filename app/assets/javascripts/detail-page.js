  $(function() {
    $('img.photo-list').mouseover(function(){
    // "_thumb"を削った画像ファイル名を取得
    var selectedSrc = $(this).attr('src').replace(/^(.+)_photo-list(\.gif|\.jpg|\.png+)$/, "$1"+"$2");
    
    // 画像入れ替え
    $('img.photo-main').stop().fadeOut(50,
    function(){
    $('img.photo-main').attr('src', selectedSrc);
    $('img.photo-main').stop().fadeIn(200);
    }
    );
    // サムネイルの枠を変更
    $(this).css({"border":"none"});
    });
    
    // マウスアウトでサムネイル枠もとに戻す
    $('img.photo-list').mouseout(function(){
    $(this).css({"border":""});
    });
  });
