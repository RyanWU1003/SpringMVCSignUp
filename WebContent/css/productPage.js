$(function(){

	$(".mycart").hide();

/*	$(".showMyCart").click(function(){
		if(!($(".mycart").hasClass("show"))){
				$(".mycart").show();
				$(".mycart").addClass("show");
				
			}else{
				$(".mycart").hide();
				$(".mycart").removeClass("show");
				
			}
		}) */
	loadMyCart();
	function loadMyCart(){
		$.ajax({
		url:"loadMyCart",
		type:"POST",
		dataType:"json",
		success:function(result){
				var rs =JSON.parse(JSON.stringify(result));
				var s ="";
				var sum=0;
				var count =0;
				if(rs.length==0){
					$("#cartTable").html("購物車是空的");
					$("#badge").html(count);
				}else{
				
				$.each(rs,function(i,v){
					count+=1;
					sum+=v.product.price*v.quantity;
					s+=`<tr><td>${v.product.productName}</td><td>${v.quantity}</td><td>${v.product.price}</td><td>${v.product.price*v.quantity}</td><td><button type="button" id="${v.product.productID}" class="delproduct">刪除</button></td></tr>`
				});
				$("#cartTable").html(s+`<tr><td>${sum}</td></tr><tr><td><button><a href="goToCart">前往購物車</a></button></td></tr>`);
				$("#badge").html(count);}
				}
		})
		}
	
	$(document).on('click','.add2Cart',function(e){
			e.preventDefault();
		    var productid =$(this).attr('id');
			fetch("addToCart?id="+productid+"&quantity=1",{method:"GET"})
			.then(response=>{return response.json();})
			.then(result=>{loadMyCart();})

		})
		

	$(document).on('click','.delproduct',function(e){
			e.preventDefault();
		    var productid =$(this).attr('id');
			fetch("deletProduct?id="+productid,{method:"GET"})
			.then(response=>{return response.json();})
			.then(result=>{loadMyCart();})
		
	})
		
	
})