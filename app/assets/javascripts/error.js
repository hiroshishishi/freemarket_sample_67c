$(document).on('turbolinks:load', function(){
	function input_check(){
		var result = true;

		// エラー用装飾のためのクラスリセット
		$('#image').removeClass("inp_error");
		$('#title').removeClass("inp_error");
		$('#text').removeClass("inp_error");
		$('#category').removeClass("inp_error");
		$('#condition').removeClass("inp_error");
		$('#fee').removeClass("inp_error");
		$('#prefecture').removeClass("inp_error");
		$('#delivery').removeClass("inp_error");
		$('#price').removeClass("inp_error");

		// 入力エラー文をリセット
		$("#image_error").empty();
		$("#title_error").empty();
		$("#text_error").empty();
		$("#category_error").empty();
		$("#condition_error").empty();
		$("#fee_error").empty();
		$("#prefecture_error").empty();
		$("#deliveryday_error").empty();
		$("#price_error").empty();

		// 入力内容セット
		var image   = $("#preview-content").val();
		var title   = $("#title").val();
		var text  = $("#text").val();
		var category = $("#parent_category").val();
		var condition  = $("#condition").val();
		var fee  = $("#fee").val();
		var prefecture = $("#prefecture").val();
		var deliveryday  = $("#deliveryday").val();
		var price  = $("#price").val();

		// 入力内容チェック

		// 商品画像
		if(image == ""){
			$("#image_error").html(" 画像は必須です。");
			$("#image").addClass("inp_error");
			result = false;
		}

		// 商品名
		if(title == ""){
			$("#title_error").html(" 商品名は必須です。");
			$("#title").addClass("inp_error");
			result = false;
		}else if(title.length > 40){
			$("#title_error").html(" 商品名は40文字以内で入力してください。");
			$("#title").addClass("inp_error");
			result = false;
		}
		// 商品の説明
		if(text == ""){
			$("#text_error").html(" 商品の説明は必須です。");
			$("#text").addClass("inp_error");
			result = false;
		}else if(text.length > 1000){
			$("#text_error").html(" 商品の説明は1000文字以内入力してください。");
			$("#text").addClass("inp_error");
			result = false;
		}
		// カテゴリー
		if(category == ""){
			$("#category_error").html(" 選択してください。");
			$("#category").addClass("inp_error");
			result = false;
		}
		// 商品の状態
		if(condition == ""){
			$("#condition_error").html(" 選択してください。");
			$("#condition").addClass("inp_error");
			result = false;
		}
		// 配送料の負担
		if(fee == ""){
			$("#fee_error").html(" 選択してください。");
			$("#fee").addClass("inp_error");
			result = false;
		}
		// 発送元の地域
		if(prefecture == ""){
			$("#prefecture_error").html(" 選択してください。");
			$("#prefecture").addClass("inp_error");
			result = false;
		}
		// 発送までの日数
		if(deliveryday == ""){
			$("#deliveryday_error").html(" 選択してください。");
			$("#deliveryday").addClass("inp_error");
			result = false;
		}
		// 価格
		if(price == ""){
			$("#price_error").html(" 価格は必須です。");
			$("#title").addClass("inp_error");
			result = false;
		}else if(price < 300){
			$("#price_error").html(" 価格は300円以上で入力してください。");
			$("#price").addClass("inp_error");
			result = false;
		}else if(price > 9999999){
			$("#price_error").html(" 価格は9,999,999円以内で入力してください。");
			$("#price").addClass("inp_error");
			result = false;
		}

		return result;
	};
	$('#btn_submit').click(function(){
		if(input_check()){
			return false;
		}
	});
});