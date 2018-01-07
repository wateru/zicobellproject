<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="header.jsp"%>
<style>
.fix {
	position: fixed;
}

.container {
	position: relative;
	width: 50%;
	display: inline-block;
	display: inline-block;
}
.hees {
	position: relative;
}

.heekyung {
	opacity: 1;
	display: block;
	width: 100%;
	height: auto;
	transition: .5s ease;
	backface-visibility: hidden;
}

.heekyungmiddle {
	transition: .5s ease;
	opacity: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%)
}

.container:hover .heekyung {
	opacity: 0.3;
}

.container:hover .heekyungmiddle {
	opacity: 1;
}

.heekyungtext {
	background-color: black;
	color: white;
	font-size: 16px;
	padding: 16px 32px;
}


@charset "utf-8";

@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,700,600);

html,
html a {
  -webkit-font-smoothing: antialiased;
  text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.004);
}

body {
  background-color: #fff;
  color: #666;
  font-family: 'Open Sans', sans-serif;
  font-size: 62.5%;
  margin: 0 auto;
}

a {
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

input,
button {
  border: 0 none;
  outline: 0 none;
}

button {
  background-color: #666;
  color: #fff;
}

button:hover,
button:focus {
  background-color: #555;
}

img,
.basket-module,
.basket-labels,
.basket-product {
  width: 100%;
}

input,
button,
.basket,
.basket-module,
.basket-labels,
.item,
.price,
.quantity,
.subtotal,
.basket-product,
.product-image,
.product-details {
  float: left;
}

.price:before,
.subtotal:before,
.total-value:before,
.promo-value:before {

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

.basket,
aside {
  padding: 0 1rem;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

.basket {
  width: 70%;
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

.promo-code-field:hover,
.promo-code-field:focus {
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
  display: inline-block;
  padding: 0.625rem 0;
}

li.price:before,
li.subtotal:before {
  content: '';
}

.item {
  width: 55%;
}

.price,
.quantity,
.subtotal {
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
  width: 250px;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

.summary-total-items {
  color: #666;
  font-size: 0.875rem;
  text-align: center;
}

.summary-subtotal,
.summary-total {
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  clear: both;
  margin: 1rem 0;
  overflow: hidden;
  padding: 0.5rem 0;
}

.subtotal-title,
.total-title,
.total-value,
.promo-title,
.promo-value {
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

.subtotal-value,
.total-value {
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
  aside,
  .basket,
  .summary,
  .item,
  .remove {
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
  .price,
  .subtotal {
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
    width: 28%;
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

						<c:forEach items="${menu}" var="menu">
							<div class="container">
								<span class="image left fit heekyung"><img
									src="displayFile?fileName=${menu.imgName}/"  /></span>
						
							
								<h3 class="hees">
									<span>메뉴:${menu.menuName}</span> 
									<br>
									<br>
									
									<span>가격:${menu.menuPrice}원</span>
									<input type="hidden" id="menu" value="${menu.menuName}">
									<input type="hidden"id="menuNo" value="${menu.menuNo}">
									<input type="hidden" id="price" value="${menu.menuPrice}">
								</h3>
							
							</div>
	
							<hr>
						</c:forEach>
					<!-- 
					<c:forEach items="${menu}" var="menu">
					<h3>
					<p>
					<span class="image fit left "><img src="displayFile?fileName=${menu.imgName}/" alt="" /></span>					
					${menu.menuPrice}
					<br>
					<br>
					<br>
					${menu.menuName}
					</p>
					</h3>
					</c:forEach>
					 -->
					
					
					
					</div>
					
					
					<div class="4u 12u$(medium)">
					<form method="post" action="/order/postpaytest">
					<c:forEach items="${menu}" var="menu">
					<input type="hidden" name="storeNo" value="${menu.storeNo}">
					</c:forEach>
						<div class="summary">
        <div class="summary-total-items"><span class="total-items"></span> Items in your Bag</div>
        <div class="summary-subtotal heehee" >
          
        </div>
        
        <div class="summary-total">
          <div class="total-title">Total</div>
          <input type="hidden" id="totalheekyung" name="totalheekyung" value=0>
          <div class="total-value final-value" id="basket-total">
          	
          </div>
        </div>
        <div class="summary-checkout">
          <button class="checkout-cta">주문하기</button>
        </div>
      </div>
      </form>
						</div>
					</div>

				</div>
			</div>
		</div>
	
	
	
	
	
</section>
<script>

	$(".container").on("click", function(e){
		var menu = $(this).children("h3").children("#menu").val(); 
		var menuNo = $(this).children("h3").children("#menuNo").val(); 
		var price = $(this).children("h3").children("#price").val();       
		var menuid = menu.replace(" ", ""); 
		var menuid2="#"+menuid+"count";
		$("menuid2").on('input',function(){
			console.log($(this).val());
			
		});
		
// 		console.log( menu );

		// 		var menu = $(this).children("#name").val();
// 		var price = $(this).children("#price").val();

// 		console.log(menu);
// 		console.log(price);
		
//		console.log($(".summary-subtotal").children("#"+menu).length);
		if($(".summary-subtotal").children("#"+menuid).length == 0){
			var str = '';
			str = '<div id="'+ menuid +'"><div class="subtotal-title">'+menu +'</div> '+
					'<input class="quantity-field" type="number" name="menuheeCount" id="'+menuid+'count" value="1" min="1">'+
					'<input type="hidden" name="menuNo" value='+menuNo+'>' +
					'<input type="hidden" name="menuName" value='+menu+'>' +
					'<input type="hidden" name="menuPrice" class="popprice"  value='+price+'>' +
					'<input type="hidden" name="heeSubTotalPrice" class="totprice" value='+price+'>' +
					'<div class="subtotal-value final-value hee" id="basket-subtotal '+ menu +'price">'+ price +'</div></div><br>';
			$(".summary-subtotal").append(str);
			totprice();
		}else{
			
			
			e.preventDefault();
// 			var $price = $(".hee");
// 			var result = $price.text() *1;

 //			$("#"+menuid+"count").val( ($("#"+menuid+"count").val() * 1)  + 1);
// 			$price.text( result + price*1 );
		}
	});
	$(".heehee").on("click",".quantity-field",function(){
		var $this = $(this);
		console.log("변경");
		$this.siblings(".hee").text($this.siblings(".popprice").val() * $this.val());
		$this.siblings(".totprice").val($this.siblings(".popprice").val() * $this.val());
		totprice();
	});
	var totprice = function(){
		var tot = 0;
		for(var i = 0; i < $(".heehee .totprice").size(); i++){
			tot += ($(".heehee .totprice")[i].value * 1)
		}
		$("#basket-total").text(tot + " 원")
		$("#totalheekyung").val(tot);
		
	}

	
	/* 
	
	var menuid2="#"+menuid+"count";
	$("menuid2").on('input',function(){
		console.log($(this).val());
		
	});
	 */
	
	
// 	$(".container").on("click", function(){

// 		var menu = $(this).children("h3").children("#menu").val(); 
// 		var price = $(this).children("h3").children("#price").val();       

// 		// 		var menu = $(this).children("#name").val();
// // 		var price = $(this).children("#price").val();

// // 		console.log(menu);
// // 		console.log(price);
		
// 		if($(".summary-subtotal").children("#"+menu).length == 0){
// 			var str = '';
// 			str = '<div class="subtotal-title" id="'+ menu +'">'+ "&nbsp;"+menu +'</div> <div class="subtotal-value final-value hee" id="basket-subtotal '+ menu +'price">'+ price +'</div>';
// 			$(".summary-subtotal").append(str);
// 		} else {
// 			var $price = $(".hee");
// 			var result = $price.text() *1;
//  			$("#"+menu+"count").val( ($("#"+menu+"count").val() * 1)  + 1);
// 			$price.text( result + price*1 );
// 		}
// 	});
	
// 	$(".heehee").on("change", "input[type='number']", function(){
// 		console.log("바뀌어쪙");
// 	});

</script>

<!-- Four -->


<%@ include file="footer.jsp"%>

</body>
</html>