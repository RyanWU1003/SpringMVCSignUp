$(function(){
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
					perSum=v.product.price*v.quantity
					s+=`<tr><td>${v.product.productName}</td><td><button class='qtyMinus' name="${v.product.productID}">-</button><input min='1' class='pqty' value="${v.quantity}" /><button type="button" class="qtyAdd" name="${v.product.productID}">+</button><span class="${v.product.productID}stock" name="${v.stock}">剩下${v.stock}件</span></td><td>${v.product.price}</td><td>${perSum}</td><td><button type="button" id="${v.product.productID}" class="delproduct">刪除</button></td></tr>`
				});
				$("#cartTable").html(s+`<tr><td>${sum}</td></tr><tr><td><button><a href="check">結帳</a></button></td></tr>`);
				$("#badge").html(count);}
				}
		})
		}
		
		$(document).on('click','.qtyMinus',function(e){
			e.preventDefault();
			var index=$(this).parent().parent().index();
			var qty=parseInt($(`.pqty:eq(${index})`).val());
			if(qty<=1){return;
			}else{
		    var productid =$(this).attr('name');
			fetch("changeQuantity?id="+productid+"&quantity="+(qty-1),{method:"GET"})
			.then(response=>{return response.json();})
			.then(result=>{loadMyCart();})}		
	})
		$(document).on('click','.qtyAdd',function(e){
			e.preventDefault();
			var index=$(this).parent().parent().index();
			var qty=parseInt($(`.pqty:eq(${index})`).val());
		    var productid =$(this).attr('name');
			var stock =$(`.${productid}stock`).attr('name');
			
			fetch("changeQuantity?id="+productid+"&quantity="+(qty+1),{method:"GET"})
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