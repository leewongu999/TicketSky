<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/adminAside.jsp"></jsp:include>

<div class="col-12 col-md-8 col-lg-9">
                    <div class="row">
                      <h4>회원 관리</h4>
                    </div>
                    <hr>
                    <div class="row">          
	                        <form class="form-inline pull-right" action="">
                            <select id="searchSelectBox" name="searchType" class="form-control input-sm">
                                <option value="searchUser">회원명</option>
                                <option value="searchUser">아이디</option>
                                <option value="searchTitle">회원등급</option>
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
                              <th scope="col">아이디</th>
                              <th scope="col">회원명</th>
                              <th scope="col">이메일</th>
                              <th scope="col">회원등급</th>
                              <th scope="col">가입일</th>
                              <th scope="col">비고</th>
                          </tr>
                      </thead>
                      <tbody>
						<c:forEach items="${list }" var="m">
      		               	<tr>
      			                <td>${m.userId }</td>
      			                <td>${m.userName }</td>
                            <td>${m.email }</td>
      			                <td>${m.ratingName }</td>
      			                <td><fmt:formatDate value="${m.enrollDate}" pattern="yyyy-MM-dd"/></td>
      			                <td> <button type="button" class="btn btn-sm btn-danger" name="button">삭제</button> </td>
      			            </tr>
      			        </c:forEach>
      		             </tbody>
                      </table>
                      ${pageBar }
                      <!-- <div class="row" style="margin:auto;">
                        <nav aria-label="Page navigation example" >
                        <ul class="pagination">
                        <li class="page-item" style="margin:0;">
                        <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                        </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"  style="margin:0;">
                        <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                        </a>
                        </li>
                        </ul>
                        </nav>
                      </div>
 -->
                    </div>
                  </div>
              </div>
          </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>