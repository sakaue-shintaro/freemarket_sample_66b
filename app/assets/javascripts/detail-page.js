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

// $(function(){
//   $('.product-box__main-content__photo__sub-photo__list li').hover(function(){
//       //オーバーしたliのインデックスを取得
//       var index = $('.product-box__main-content__photo__sub-photo__list li').index(this);
//       //オーバーした画像URLを取得
//       var imageurl = $('.product-box__main-content__photo__sub-photo__list li').eq(index).find('@image.url').attr('src');
//       //ulのクラス名を取得（空白で分割）
//       className = $(this).parent().attr('class').split(" ");
//       // 元のメイン画像を保存しておく
//       defaultImage = $('img.photo-main.'+className[1]).attr('src');
//       $('img.photo-main' + className[1]).attr('src',imageurl);
//   },function(){
//       $('img.photo-main' + className[1]).attr('src',defaultImage);
//   });
// });

// $(function(){
//   $('.subimage li').hover(function(){
//       //オーバーしたliのインデックスを取得
//       var index = $('.subimage li').index(this);
//       //オーバーした画像URLを取得
//       var imageurl = $('.subimage li').eq(index).find('img').attr('src');
//       //ulのクラス名を取得（空白で分割）
//       className = $(this).parent().attr('class').split(" ");
//       //元のメイン画像を保存しておく
//       defaultImage = $('img.mainimage.'+className[1]).attr('src');
//       $('img.mainimage.'+className[1]).attr('src',imageurl);
//   },function(){
//       $('img.mainimage.'+className[1]).attr('src',defaultImage);
//   });
// });

// HTML
// <div class="box_around">
// 	<div class="main_image_box">
// 		<img src="../img/20180913/box01_img01.jpg" alt="" class="mainimage img01">
// 	</div>				
// 	<!-- ***** サムネイル ***** -->
// 	<div class="detail">
// 		<ul class="subimage img01">
// 			<li><img src="../img/20180913/box01_img01.jpg"></li>
// 			<li><img src="../img/20180913/box01_img02.jpg"></li>
// 			<li><img src="../img/20180913/box01_img03.jpg"></li>
// 		</ul>
// 	</div><!-- .detail end -->
// </div><!-- .box_around end -->
 
// <div class="box_around">
// 	<div class="main_image_box">
// 		<img src="../img/20180913/box02_img01.jpg" alt="" class="mainimage img02">
// 	</div>			
// 	<!-- ***** サムネイル ***** -->
// 	<div class="detail">
// 		<ul class="subimage img02">
// 			<li><img src="../img/20180913/box02_img01.jpg"></li>
// 			<li><img src="../img/20180913/box02_img02.jpg"></li>
// 			<li><img src="../img/20180913/box02_img03.jpg"></li>
// 		</ul>
// 	</div><!-- .detail end -->
// </div><!-- .box_around end --></ul>

// CSS
// img{ width:100%; }
// .box_around{
//     width:30%;
//     float:left;
//     margin-right:15px;
//     margin-bottom:30px;
// }
// .detail ul{
//     display:inline-block;
//     width:100%;
//     padding:0;
//     margin:0;
// }
// .detail ul li{
//     display:inline-block;
//     width:33.3%;
//     float:left;
// }
// .detail ul li img{
//     max-width:95%;
//     margin:0 auto;
//     display:block;
// }