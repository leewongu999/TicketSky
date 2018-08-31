<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/consumerAside.jsp"></jsp:include>

      

                  <div class="col-12 col-md-8 col-lg-9">
                      <div class="shop_grid_product_area">
                        <div class="row">
                          <h3>회원정보수정</h3>
                        </div>
                        <hr>
                        <div class="row">
                          <div class="col-12" style="text-align:center; background-color:#e5e5e5; margin:3% 0%; padding: 3.5%;">
                            <span style="font-size:1.3em">회원님은 '일반회원' 이십니다.</span>
                          </div>
                        </div>
                        <div class="row">
                          <table class="table table-bordered myInfo" >
                            <tr>
                              <td style="vertical-align: middle;">아이디</td>
                              <td style="vertical-align: middle;">tlvm21</td>
                            </tr>
                            <tr>
                              <td  style="vertical-align: middle;">이름</td>
                              <td style="vertical-align: middle;">김성조</td>
                            </tr>
                            <tr>
                              <td style="vertical-align: middle;">이메일</td>
                              <td style="vertical-align: middle;">tlvm21@naver.com</td>
                            </tr>
                            <tr>
                              <td style="vertical-align: middle;">연락처</td>
                              <td style="vertical-align: middle;">010-1234-5678</td>
                            </tr>
                            <tr>
                              <td style="vertical-align: middle;">주소</td>
                              <td style="vertical-align: middle;">경기도 수원시 영통구 강남처인로 kh정보교육원 건물 101동 101호</td>
                            </tr>
                          </table>
                        </div>

                      </div>

                      <div class="row" >
                          <button class="btn btn-primary" type="button" name="button" style="margin:auto" onclick="location.href='${path}/ticketsky/user/userUpdate'">회원정보 수정</button>
                      </div>
                  </div>
              </div>
          </div>
      </section>
      <!-- ##### Shop Grid Area End ##### -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>