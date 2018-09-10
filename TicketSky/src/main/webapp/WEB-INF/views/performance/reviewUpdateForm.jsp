<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<c:set var="path" value="<%=request.getContextPath()%>"/>
<script src="${path}/resources/sebu/js/single_custom.js"></script>
	<script>
		
		$(function(){
			$('#star_update_score').children().on('click',function(){
				var starScore = $(this).children().attr('name');
				console.log($(this).children());
				$('#starUpdateScore').val(starScore);
			});
		});
		
		$(function(){
			var score=${PERFORMSCORE};
			switch(score)
			{
			case 1: break;
			case 2: 
				$('.re_${REVIEWNO}').children().eq(1).children().attr('class','fa fa-star');
				break;
			case 3: 
				$('.re_${REVIEWNO}').children().eq(1).children().attr('class','fa fa-star');
				$('.re_${REVIEWNO}').children().eq(2).children().attr('class','fa fa-star');
				break;
			case 4: 
				$('.re_${REVIEWNO}').children().eq(1).children().attr('class','fa fa-star');
				$('.re_${REVIEWNO}').children().eq(2).children().attr('class','fa fa-star');
				$('.re_${REVIEWNO}').children().eq(3).children().attr('class','fa fa-star');
				break;
			case 5: 
				$('.re_${REVIEWNO}').children().eq(1).children().attr('class','fa fa-star');
				$('.re_${REVIEWNO}').children().eq(2).children().attr('class','fa fa-star');
				$('.re_${REVIEWNO}').children().eq(3).children().attr('class','fa fa-star');
				$('.re_${REVIEWNO}').children().eq(4).children().attr('class','fa fa-star');
				break;
			default : break;
			}
		});
		
	</script>
	<div id='review_${REVIEWNO }' class="user_review_container flex-column flex-sm-row">
		<div>
			<div class="review_date">
				<fmt:formatDate value="${REVIEWDATE }" pattern="yyyy-MM-dd"/><br>
			</div>
			
			<div class="user_name">
				${USERID }
				<span>
					<ul id='star_update_score' class="user_upStar_rating re_${REVIEWNO}">
						<li><i class="fa fa-star" name='1' aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" name='2' aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" name='3' aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" name='4' aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" name='5' aria-hidden="true"></i></li>
					</ul>
					<input type='hidden' id='starUpdateScore' name='starUpdateScore' value='${PERFORMSCORE }'/>
				</span>
			</div>
			<div>
				<textarea id="reviewUp_message" class="input_review" style='margin-bottom: 10px;' name="up_review"  placeholder="Update Review" rows="5" cols="160" required data-error="Please, leave us a review.">${REVIEWCONTENT }</textarea>
				<input id='up_reviewNo' type='hidden' name='reviewNo' value='${REVIEWNO }'/>
				<input id='up_performNo' type='hidden' name='performNo' value='${PERFORMNO }'/>
				<div class="text-left text-sm-right">
					<button id="review_update_submit" type="button" class="red_button review_submit_btn trans_300">수정</button>
					<button id="review_cancel" type="button" class="red_button review_submit_btn trans_300">뒤로</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	