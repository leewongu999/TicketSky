<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/sellerAside.jsp"></jsp:include>


<div class="col-12 col-md-8 col-lg-9">
                    <div class="row">
                      <h4>내 공연</h4>
                    </div>
                    <hr>
                    <div class="row">     
                    	<div class="col-md-4">전체 ${totalCount }</div>     
	                        <form class="form-inline col-md-8" action="${path }/ticketsky/user/sellerMyPlayList">
                            <select id="searchSelectBox" name="searchType" class="form-control input-sm">
                                <option value="performName">공연제목</option>
                                <option value="placeName">공연장명</option>
                            </select>
                            &nbsp;&nbsp;
                            <input type="text" class="form-control" name="searchTitle"/>
                            &nbsp;&nbsp;
                            <button type="submit" class="btn btn-primary floa">조회</button>
	                        </form>
                    </div>
                    <!-- /.content -->
                    <div class="row" style="margin-top:3%;">
                      <table class="tableTL table table-striped"  style="text-align:center;">
                      <!-- <colgroup>
                         <col width="1%"/>
                            <col width="2%"/>
                            <col width="10%"/>
                            <col width="2%"/>
                            <col width="25%"/>
                            <col width="4%"/>
                            <col width="5%"/>
                            <col width="6%"/>
                      </colgroup> -->
                      <thead>
                          <tr>
                              <th scope="col">공연제목</th>
                              <th scope="col">공연장명</th>
                              <th scope="col">공연시작일</th>
                              <th scope="col">공연종료일</th>
                              <th scope="col">작성일</th>
                              <th scope="col">승인여부</th>
                          </tr>
                      </thead>
                      <tbody>
						<c:forEach items="${list }" var="p">
      		               	<tr>
      			                <td>${p.PERFORMNAME }</td>
      			                <td>${p.PLACENAME }</td>
      			                <td><fmt:formatDate value="${p.STARTDATE}" pattern="yyyy-MM-dd"/></td>
      			                <td><fmt:formatDate value="${p.ENDDATE}" pattern="yyyy-MM-dd"/></td>
      			                <td><fmt:formatDate value="${p.REGDATE}" pattern="yyyy-MM-dd"/></td>
      			                <td><button type="button" class="btn btn-sm btn-info" name="button">승인 또는 대기 수정해라</button> </td>
      			            </tr>
      			       </c:forEach>
      		             </tbody>
                      </table>
                      ${pageBar }

                    </div>
                  </div>
              </div>
          </div>
      </section>
      <!-- ##### Shop Grid Area End ##### -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>