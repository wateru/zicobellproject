<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/assets/css/timepicki.css" />

<style>
.fix {
	position: fixed;
}

@charset "utf-8";

@import
	url(https://fonts.googleapis.com/css?family=Open+Sans:400,700,600);

/* html, html a {
	-webkit-font-smoothing: antialiased;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.004);
}
 */
.summary {
	background-color: #fff;
	color: #666;
	font-family: 'Open Sans', sans-serif;
	font-size: 62.5%;
	margin: 0 auto;
}

/* a {
	border: 0 none;
	outline: 0;
	text-decoration: none;
}

strong {
	font-weight: bold;
}

p {
	margin: 0.75rem 0 0;
}

h1 {
	font-size: 0.75rem;
	font-weight: normal;
	margin: 0;
	padding: 0;
}

 */
input, button {
	border: 0 none;
	outline: 0 none;
}

button {
	background-color: #666;
	color: #fff;
}

button:hover, button:focus {
	background-color: #555;
}

img, .basket-module, .basket-labels, .basket-product {
	width: 100%;
}

input, button, .basket, .basket-module, .basket-labels, .item, .price,
	.quantity, .subtotal, .basket-product, .product-image, .product-details
	{
	float: left;
}


.hide {
	display: none;
}

main {
	clear: both;
	font-size: 0.75rem;
	margin: 0 auto;
	overflow: hidden;
	padding: 1rem 0;
	width: 960px;
}

.basket, aside {
	padding: 0 1rem;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.basket {
	width: 100%;
}

.basket-module {
	color: #111;
}

label {
	display: block;
	margin-bottom: 0.3125rem;
}

.promo-code-field {
	border: 1px solid #ccc;
	padding: 0.5rem;
	text-transform: uppercase;
	transition: all 0.2s linear;
	width: 48%;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-o-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
}

.promo-code-field:hover, .promo-code-field:focus {
	border: 1px solid #999;
}

.promo-code-cta {
	border-radius: 4px;
	font-size: 0.625rem;
	margin-left: 0.625rem;
	padding: 0.6875rem 1.25rem 0.625rem;
}

.basket-labels {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	margin-top: 1.625rem;
}

ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

li {
	color: #111;
	padding: 0.625rem 0;
}
 

li.price:before, li.subtotal:before {
	content: '';
}

.item {
	width: 55%;
}

.price, .quantity, .subtotal {
	width: 15%;
}

.subtotal {
	text-align: right;
}

.remove {
	bottom: 1.125rem;
	float: right;
	position: absolute;
	right: 0;
	text-align: right;
	width: 45%;
}

.remove button {
	background-color: transparent;
	color: #777;
	float: none;
	text-decoration: underline;
	text-transform: uppercase;
}

.item-heading {
	padding-left: 4.375rem;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.basket-product {
	border-bottom: 1px solid #ccc;
	padding: 1rem 0;
	position: relative;
}

.product-image {
	width: 35%;
}

.product-details {
	width: 65%;
}

.product-frame {
	border: 1px solid #aaa;
}

.product-details {
	padding: 0 1.5rem;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.quantity-field {
	background-color: #ccc;
	border: 1px solid #aaa;
	border-radius: 4px;
	font-size: 0.625rem;
	padding: 2px;
	width: 3.75rem;
}

aside {
	float: right;
	position: relative;
	width: 30%;
}

.summary {
	background-color: #eee;
	border: 1px solid #aaa;
	padding: 1rem;
	position: fixed;
	width: 330px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.summary-total-items {
	color: #666;
	font-size: 0.875rem;
	text-align: center;
}

.summary-subtotal, .summary-total {
	border-top: 1px solid #ccc;
	/* border-bottom: 1px solid #ccc; */
	clear: both;
	margin: 1rem 0;
	overflow: hidden;
	padding: 0.5rem 0;
}

.subtotal-title, .subtotal-value, .total-title, .total-value,
	.promo-title, .promo-value {
	color: #111;
	float: left;
	width: 50%;
}

.summary-promo {
	-webkit-transition: all .3s ease;
	-moz-transition: all .3s ease;
	-o-transition: all .3s ease;
	transition: all .3s ease;
}

.promo-title {
	float: left;
	width: 70%;
}

.promo-value {
	color: #8B0000;
	float: left;
	text-align: right;
	width: 30%;
}

.summary-delivery {
	padding-bottom: 3rem;
}

.subtotal-value, .total-value {
	text-align: right;
}

.total-title {
	font-weight: bold;
	text-transform: uppercase;
}

.summary-checkout {
	display: block;
}

.checkout-cta {
	display: block;
	float: none;
	font-size: 0.75rem;
	text-align: center;
	text-transform: uppercase;
	padding: 0.625rem 0;
	width: 100%;
}

.summary-delivery-selection {
	background-color: #ccc;
	border: 1px solid #aaa;
	border-radius: 4px;
	display: block;
	font-size: 0.625rem;
	height: 34px;
	width: 100%;
}

@media screen and (max-width: 640px) {
	aside, .basket, .summary, .item, .remove {
		width: 100%;
	}
	.basket-labels {
		display: none;
	}
	.basket-module {
		margin-bottom: 1rem;
	}
	.item {
		margin-bottom: 1rem;
	}
	.product-image {
		width: 40%;
	}
	.product-details {
		width: 60%;
	}
	.price, .subtotal {
		width: 33%;
	}
	.quantity {
		text-align: center;
		width: 34%;
	}
	.quantity-field {
		float: none;
	}
	.remove {
		bottom: 0;
		text-align: left;
		margin-top: 0.75rem;
		position: relative;
	}
	.remove button {
		padding: 0;
	}
	.summary {
		margin-top: 1.25rem;
		position: relative;
	}
}

@media screen and (min-width: 641px) and (max-width: 960px) {
	aside {
		padding: 0 1rem 0 0;
	}
	.summary {
		position: relative;
		width: 100%;
	}
}

@media screen and (max-width: 960px) {
	main {
		width: 100%;
	}
	.product-details {
		padding: 0 1rem;
	}
}
</style>
<!-- One -->
<section id="one" class="wrapper style2">
	<div class="inner">
		<div class="box">
			<div class="content">

				<!-- Elements -->
				<h2 id="elements">Elements</h2>
				<div class="row 200%">

					<div class="8u 12u$(medium)">

						<div class="basket">

							<div class="basket-labels">
								<ul>
									<li class="item item-heading">Item</li>
									<li class="price">Price</li>
									<li class="quantity">Quantity</li>
									<li class="subtotal">Subtotal</li>
								</ul>
							</div>
	
					<c:forEach items="${detail}" var="detail">
							<div class="basket-product">
								<input type="hidden" class="menuname" value="${detail.detailMenuName}">
								<div class="item">
									<div class="product-image">
										<img src="displayFile?fileName=${detail.detailMenuImg}/"
											alt="Placholder Image 2" class="product-frame">
									</div>
									<div class="product-details">
										<h1>
											<strong><span class="item-quantity">${detail.detailCount}</span> x</strong> ${detail.detailMenuName}
										</h1>
									</div>
								</div>
								<div class="price">${detail.detailPrice}</div>
								<div class="quantity">
									<input type="number" value="${detail.detailCount}" min="1" class="quantity-field">
								</div>
								<div class="subtotal">${detail.detailSubTotal}</div>
								<input type="hidden" name="menuNo" value="${detail.detailMenuNo}">
								<div class="remove">
									<button style="max-width:100%; width:100%;">
										<input type="hidden" class="detailMenuNo" name="detailMenuNo" value="${detail.detailMenuNo}">
										<input type="hidden" class="detailOrderNo" name="detailOrderNo" value="${detail.detailOrderNo}">
										Remove</button>
								</div>
							</div>
							
						</c:forEach>  
							<label>인원수
							<input type="text" class="people" value=""placeholder="인원수를 작성해주세요" />
							</label>
							<label>예약 시간
							<span><input type="text" class="timepicker" value="" placeholder="예약 시간을 작성해주세요" /></span>
							</label>
							<label>결제방법
							<select name="demo-category" id="demo-category">
								<option value="visit">방문후 결재</option>
								<option value="kakao">지금결재</option>
							</select>
							<span id="alarm"></span>
							<input type="hidden" id="fcmtoken">
							<span id="fcmalarm"></span>
							</label>
						</div>
							<br>

					</div>

					<div class="4u 12u$(medium)">

						
							<div class="summary">
								<div class="summary-total-items">
									<span class="total-items"></span> Items in your Bag
								</div>
								<div class="summary-subtotal">
									<div class="subtotal-title">Subtotal</div>
									<div class="subtotal-value final-value" id="basket-subtotal">${order.orderTotPrice}</div>
									<div class="summary-promo hide">
										<div class="promo-title">Promotion</div>
										<div class="promo-value final-value" id="basket-promo"></div>
									</div>
								</div>							
								<div class="summary-total">
									<div class="total-title">Total</div>
									<div class="total-value final-value" id="basket-total">${order.orderTotPrice}</div>
								</div>
								<div class="summary-checkout" >
									<button class="checkout-cta" style="max-width:100%; width:100%; padding:0;">Go to Secure Checkout</button>
								</div>
							</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="/resources/assets/js/timepicki.js"></script>

<script>
	var promoCode;
	var promoPrice;
	var fadeTime = 300;
	
	$(document).ready(function(){
		fcmstatus = "${stat}";
		console.log(fcmstatus)
		if (fcmstatus == "ok"){
			$("#alarm").text("알람을 설정중입니다..")
			$("#alarm").css("color","black")
			$("#fcmalarm").html('<iframe src="https://zicobell-654d2.firebaseapp.com/token.html" hidden></iframe>')
		} else {
			$("#alarm").text("알람을 선택하지 않으셨습니다.")
			$("#alarm").css("color","black")
		}
	})
	
	$(".timepicker").timepicki();
	
	/* Assign actions */
	$('.quantity input').change(function() {
	  updateQuantity(this);
	});
	
	$('.remove button').click(function() {
	  removeItem(this);
	});
	
	$(document).ready(function() {
	  updateSumItems();
	});
	
	$('.promo-code-cta').click(function() {
	
	  promoCode = $('#promo-code').val();
	
	  if (promoCode == '10off' || promoCode == '10OFF') {
	    //If promoPrice has no value, set it as 10 for the 10OFF promocode
	    if (!promoPrice) {
	      promoPrice = 10;
	    } else if (promoCode) {
	      promoPrice = promoPrice * 1;
	    }
	  } else if (promoCode != '') {
	    alert("Invalid Promo Code");
	    promoPrice = 0;
	  }
	  //If there is a promoPrice that has been set (it means there is a valid promoCode input) show promo
	  if (promoPrice) {
	    $('.summary-promo').removeClass('hide');
	    $('.promo-value').text(promoPrice.toFixed(0));
	    recalculateCart(true);
	  }
	});
	
	/* Recalculate cart */
	function recalculateCart(onlyTotal) {
	  var subtotal = 0;
	
	  /* Sum up row totals */
	  $('.basket-product').each(function() {
	    subtotal += parseFloat($(this).children('.subtotal').text());
	  });
	
	  /* Calculate totals */
	  var total = subtotal;
	
	  //If there is a valid promoCode, and subtotal < 10 subtract from total
	  var promoPrice = parseFloat($('.promo-value').text());
	  if (promoPrice) {
	    if (subtotal >= 10) {
	      total -= promoPrice;
	    } else {
	      alert('Order must be more than £10 for Promo code to apply.');
	      $('.summary-promo').addClass('hide');
	    }
	  }
	
	  /*If switch for update only total, update only total display*/
	  if (onlyTotal) {
	    /* Update total display */
	    $('.total-value').fadeOut(fadeTime, function() {
	      $('#basket-total').html(total.toFixed(0));
	      $('.total-value').fadeIn(fadeTime);
	    });
	  } else {
	    /* Update summary display. */
	    $('.final-value').fadeOut(fadeTime, function() {
	      $('#basket-subtotal').html(subtotal.toFixed(0));
	      $('#basket-total').html(total.toFixed(0));
	      if (total == 0) {
	        $('.checkout-cta').fadeOut(fadeTime);
	      } else {
	        $('.checkout-cta').fadeIn(fadeTime);
	      }
	      $('.final-value').fadeIn(fadeTime);
	    });
	  }
	}
	
	/* Update quantity */
	function updateQuantity(quantityInput) {
	  /* Calculate line price */
	  var productRow = $(quantityInput).parent().parent();
	  var price = parseFloat(productRow.children('.price').text());
	  var quantity = $(quantityInput).val();
	  var linePrice = price * quantity;
	
	  /* Update line price display and recalc cart totals */
	  productRow.children('.subtotal').each(function() {
	    $(this).fadeOut(fadeTime, function() {
	      $(this).text(linePrice.toFixed(0));
	      recalculateCart();
	      $(this).fadeIn(fadeTime);
	    });
	  });
	
	  productRow.find('.item-quantity').text(quantity);
	  updateSumItems();
	}
	
	function updateSumItems() {
	  var sumItems = 0;
	  $('.quantity input').each(function() {
	    sumItems += parseInt($(this).val());
	  });
	  $('.total-items').text(sumItems);
	}
	
	/* Remove item from cart */
	function removeItem(removeButton) {
	  /* Remove row from DOM and recalc cart total */
	  var productRow = $(removeButton).parent().parent();
	  
	
	  console.log($(this).children.input);
	  productRow.slideUp(fadeTime, function() {
	    productRow.remove();
	  
	    recalculateCart();
	    updateSumItems();
	  });
	  
	  console.log($(removeButton).children(".detailMenuNo").val())
	  console.log($(removeButton).children(".detailOrderNo").val())
	var removeItem = {"removeMenu":$(removeButton).children(".detailMenuNo").val(),
		  				"removeOrder":$(removeButton).children(".detailOrderNo").val()}
	  $.ajax({
		    type: 'POST', //post,get,등..전송방식
		    url: '/order/menuDelete',
		    contentType : 'application/json; charset=UTF-8',
		    data: JSON.stringify(removeItem),
		    success: function(data){
		    	
		    } });
	  
	  
	  $.ajax({
	      url:'/order/menuDelete',
	      data:formData ,
	      dataType:"int",
	      processData: false,
	      contentType: false,
	      type: 'POST',
	      success: "데이터가 지워짐"
	   
	   });
	}
	
	var IMP = window.IMP;
	IMP.init('imp98404187');
	$(".checkout-cta").on("click",function(){
		
		if($(".people").val() != ""){
			if($("#demo-category").val() == "kakao"){
					IMP.request_pay({
					    pg : 'kakao', // version 1.1.0부터 지원.
					    pay_method : 'card',
					    merchant_uid : 'merchant_1234567890' + new Date().getTime(),
					    name : '주문명:결제테스트',
					    amount : 1000,
					    buyer_email : 'iamport@siot.do',
					    buyer_name : '구매자이름',
					    buyer_tel : '',
					    buyer_addr : '서울특별시 강남구 삼성동',
					    buyer_postcode : '123-456',
					    m_redirect_url : 'http://192.168.0.241:8000/order/paytest'
						}, function(rsp) {
						    if ( rsp.success ) {
						        var msg = '결제가 완료되었습니다.';
						        msg += '고유ID : ' + rsp.imp_uid;
						        msg += '상점 거래ID : ' + rsp.merchant_uid;
						        msg += '결제 금액 : ' + rsp.paid_amount;
						        msg += '카드 승인번호 : ' + rsp.apply_num;
						        postpay();
					
						    } else {
						        var msg = '결제에 실패하였습니다.';
						        msg += '에러내용 : ' + rsp.error_msg;
						        msg += '결제에 실패하셨습니다.'
					    	}
					    alert(msg);
					});
			} else {
				postpay();		
			}
		} else {
			alert("인원수를 기입해 주세요");
		}
	});
	
	console.log($( $(".basket-product")[0] ).find(".quantity-field").val())
	
	function postpay(){ 
		var receiptArray = new Array();
		for(var i = 0; i < $(".basket-product").length; i++){
		var receiptDetail = {"menu":$( $(".basket-product")[i] ).children(".menuname").val(),
							"count":$( $(".basket-product")[i] ).find(".quantity-field").val(),
							"subtotal":$( $(".basket-product")[i] ).find(".subtotal").text()}; 
			receiptArray.push(receiptDetail);
		}
		var receipt = {"no":"${order.orderStoreNo}",
					"orderno":"${order.orderNo}",
					"totalprice":$("#basket-total").text(),
					"people":$(".people").val(),
					"id":'${order.orderMemberId}',
					"pay":$("#demo-category").val(),
					"status":"afterpay",
					"token":$("#fcmtoken").val(),
					"menulist":receiptArray};
		$.ajax({
		    type: 'POST', //post,get,등..전송방식
		    url: '/clientorder',
		    contentType : 'application/json; charset=UTF-8',
	// 	    dataType: 'text',//데이타 타입
		    data: JSON.stringify(receipt),
		    success: function(data){
		    	console.log(data)
		    	console.log("성공이다.");
		        location.href="/home";
		    },
		    error:function(request,status,error){
		        /* alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); */
		        alert("정상적으로 주문처리가 되지 않았습니다.");
		       }
		});
	}
	
	function zico(token) {
			$("#fcmtoken").val(token);
			$("#alarm").text("알람을 허용하셨습니다.")
			$("#alarm").css("color","blue")
	}
	
</script>
<!-- Four -->



<%@ include file="footer.jsp"%>

</body>
</html>