$(function() {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="product[images_attributes][${index}][src]"
                    id="product_images_attributes_${index}_src" style="display:none"><label for="product_images_attributes_${index}_src"><pre>画像をアップロード</pre></label>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class="kote">
                    <img data-index="${index}" src="${url}" width="100px" height="100px">
                    <div class="imgedit${index}">
                      <div class="js-remove">画像クリック<br>して削除</div>
                    </div>
                  </div>
                  `;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-box').on('change', '.js-file', function() {
    const obj = $(this).clone();
    $(this).parent().remove();
    for(let r = 0; r<10;r++) {
      $(".imgedit"+r).before(obj);
      r + 1
    }
  });

  $('#image-box').on('click', 'img', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
})

function update_field(){
  let value = 0.9;
  let comis = 0.1;
  let result = $('#product_price').val() * value;
  $('#profit').text("¥"+result);
  let pami = $('#product_price').val() * comis;
  $('#commission').text("¥"+pami);
}
$(function() {
  $('input[type="text"]').on('keyup change', function() {
    update_field();
  });
});