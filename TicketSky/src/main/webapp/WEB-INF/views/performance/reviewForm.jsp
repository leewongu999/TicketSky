<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<c:set var="path" value="<%=request.getContextPath()%>"/>

<div id='review_${REVIEWNO }' class="user_review_container flex-column flex-sm-row">
		<div style='float:right;'>
			<button class='red_button review_submit_btn trans_30' onclick = 'fn_review_update(${REVIEWNO},${PERFORMNO })' style='width:50px; height:20px; background-color:#E4E4E4'>수정</button>
			<button class='red_button review_submit_btn trans_30' onclick ='fn_review_delete(${PERFORMNO},${REVIEWNO })' style='width:50px; height:20px; background-color:#E4E4E4'>삭제</button>
		</div>
		<div>
			<div class="review_date">
				<fmt:formatDate value="${REVIEWDATE }" pattern="yyyy-MM-dd"/><br>
			</div>
			<div class="user_name">
				${USERID }
				<script>
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
				<span>
					<ul class="star_rating re_${REVIEWNO}">
						<li><i class="fa fa-star" name='1' aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" name='2' aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" name='3' aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" name='4' aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" name='5' aria-hidden="true"></i></li>
					</ul>
				</span>
			</div>
			<div>
				<p>${REVIEWCONTENT }</p>
			</div>
		</div>
	</div>