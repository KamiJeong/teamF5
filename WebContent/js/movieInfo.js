/**
 * 
 */
var $loader = $("#loader");
var imgIdx=0,
	idx2=0;

function getMovieInfo(no) {

	$loader.show();

	$.ajax("movieInfoFind.jsp", {
		type : "POST",
		dataType : "json",
		data : {
			no : no
		},
		error : function(xhr, error, code) {
			alert("에러야?" + code);
		},
		success : function(json) {
			//alert("성공");

			var templateCode = $("#movieInfo").html();
			var tmp = _.template(templateCode);
			var markup = tmp({
				movies : json.movies,
				trailers : json.trailers,
				images : json.images,
				comments : json.comments,
				session : json.session,
				avgStar : json.avgStar
			});
			
			//alert(json.avgStar);
			$(".wrap").html(markup);
			
			
			$(".wrap").fadeIn(1000);
			idx=json.images.length;
			idx2=idx;
			
			$("iframe").on("load",function() {
				
				alert(this);
				console.log(this);
				
				//var iframe = $(this).contents();
				//alert(iframe);
				
				var doc = this.contentWindow || this.contentDocument;
				var html = doc.document.body.innerHTML;
				
				alert( html);
				
				
			});
		}
	});

}

/* 이미지 슬라이드 이전 버튼 */
$(".wrap").on("click",".steelCut_slider .left_btn",function(){
	//alert("2 : "+imgIdx);
	if (imgIdx == 0) {
		imgIdx = idx2-1;
		$(".image_box").css("left", -(imgIdx * 800));

	} else {
		--imgIdx;
		$(".image_box").css("left", -(imgIdx * 800));
	}

});

/* 이미지 슬라이드 다음 버튼 */
$(".wrap").on("click",".steelCut_slider .right_btn",function(){
	//alert("1 : "+imgIdx);
	//alert("열려라 참깨!");
	++imgIdx;

	$(".image_box").css("left", -(imgIdx * 800));
	if (imgIdx == idx2) {
		imgIdx = 0;

		$(".image_box").css("left", -(imgIdx * 800));
	}
});

$(".wrap").on("click",".popup_box",function() {
	
	//alert("test");
	
	return false;
	
});

$(".wrap").on("click",".video_box a",function(){
	var src = $(this).attr("data-src");
	//alert(src);
	$(".playTrailers").fadeIn(500);
	$(".nowTrailer").html(src);
});

$(".wrap").on("click",".like",function(){
	var memberNo = $(".like span").attr("data-memberNo");
	var commentNo = $(".like span").attr("data-commentNo");
	
	if(memberNo=="null"){
		alert("로그인을 한 뒤 이용하실 수 있습니다.");
	}else{
		//alert(no);
		
		$loader.show();

		$.ajax("updateLike.jsp", {
			type : "POST",
			dataType : "json",
			data : {
				memberNo : memberNo,
				commentNo : commentNo,
				likes : "l"
			},
			error : function(xhr, error, code) {
				alert("에러야?" + code);
			},
			success : function(json) {
				if(json.result=="true"){
					$(".like span").text(json.l);
				}else{
					alert("이미 투표 했어요!");
				}
				$loader.fadeOut(300);
			}
		});
	}
	
	
});

$(".wrap").on("click",".hate",function(){
	var memberNo = $(".hate span").attr("data-memberNo");
	var commentNo = $(".hate span").attr("data-commentNo");
	
	if(memberNo=="null"){
		alert("로그인을 한 뒤 이용하실 수 있습니다.");
	}else{
		//alert(no);
		$loader.show();

		$.ajax("updateLike.jsp", {
			type : "POST",
			dataType : "json",
			data : {
				memberNo : memberNo,
				commentNo : commentNo,
				likes : "h"
			},
			error : function(xhr, error, code) {
				alert("에러야?" + code);
			},
			success : function(json) {
				//alert(json.h);
				if(json.result=="true"){
					$(".hate span").text(json.h);
				}else{
					alert("이미 투표 했어요!");
				}
				
				$loader.fadeOut(300);
			}
		});
	}
});

$(".playTrailers").on("click",function(){
	//alert("호잇");
	$(".playTrailers").fadeOut(500);
});
var grade="";
$(".wrap").on("mouseover",".starDivFirst button",function(){
	
	var idx = $(this).index();
	
	$(".starDivSecond").width(idx*30);
	
}).on("mouseleave",".starDivFirst button",function(){
	
	$(".starDivSecond").width(grade*30);
	
});

$(".wrap").on("click",".starDivFirst button",function(){
	grade = $(this).index();
	var contents = $(this).attr("data-contents");
	$(".starDivSecond").width(grade*30);
	
	$(".input_text_box textarea").text(contents);
	
	
});

function test() {
	alert("xxxxxx");
}




$(".wrap").on("click", function() {
	$(".wrap").fadeOut(800);
});



var doughnutData = [ {
	value : 75,
	color : "blue",
	highlight : "skyblue",
	label : "Male"
}, {
	value : 25,
	color : "red",
	highlight : "hotpink",
	label : "Female"
}, ];

var lineChartData = {
	labels : [ "2/29", "3/1", "3/2", "3/3", "3/4" ],
	datasets : [ {
		label : "My First dataset",
		fillColor : "rgba(220,220,220,0.2)",
		strokeColor : "rgba(220,220,220,1)",
		pointColor : "rgba(220,220,220,1)",
		pointStrokeColor : "#fff",
		pointHighlightFill : "#fff",
		pointHighlightStroke : "rgba(220,220,220,1)",
		data : [ 110, 116, 75, 80, 107 ]
	} ]
};

/*
window.onload = function() {
	var ctx = document.getElementById("chart-area").getContext("2d");
	var ctx1 = document.getElementById("canvas2").getContext("2d");
	window.myDoughnut = new Chart(ctx).Doughnut(doughnutData, {
		responsive : true
	});
	window.myLine = new Chart(ctx1).Line(lineChartData, {
		responsive : true
	});
};
*/