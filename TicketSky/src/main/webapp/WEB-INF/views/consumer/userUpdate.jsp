<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/consumerAside.jsp"></jsp:include>

<section>
      <div class="container" style="padding-top:50px; padding:50px 10%;">
        <div class="row" style="padding-left: 3%; ">
          <h1>회원가입</h1>
        </div>
        <hr>
        <form class="form-horizontal" id="enrollform">
          <div class="form-group" >
            <label for="inputEmail" class="col-xs-2 control-label">아이디</label>
            <div class="col-xs-9">
              <input type="email" class="form-control" id="inputEmail" placeholder="아이디">
            </div>
          </div>
          <div class="form-group">
            <label for="inputPassword" class="col-xs-2 control-label">비밀번호</label>
            <div class="col-xs-9">
              <input type="password" class="form-control" id="inputPassword" placeholder="비밀번호">
              <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
            </div>
          </div>
          <div class="form-group">
            <label for="inputPasswordCheck" class="col-xs-2 control-label">비밀번호 확인</label>
            <div class="col-xs-9">
              <input type="password" class="form-control" id="inputPasswordCheck" placeholder="비밀번호 확인">
              <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
            </div>
          </div>
          <div class="form-group">
            <label for="inputRipple" class="col-xs-2 control-label">이메일</label>
            <div class="col-xs-9">
              <input type="text" class="form-control" id="inputRipple" placeholder="이메일">
            </div>
          </div>
          <div class="form-group">
            <label for="inputName" class="col-xs-2 control-label">이름</label>
            <div class="col-xs-9">
              <input type="text" class="form-control" id="inputName" placeholder="이름">
            </div>
          </div>

          <div class="form-group">
            <label for="inputName" class="col-xs-2 control-label">주소</label>
            <div class="col-xs-9">
              <input type="text" class="form-control" id="inputName" placeholder="주소">
            </div>
          </div>

            <div class="form-group">
              <label for="inputName" class="col-xs-2 control-label">생년월일</label>
              <div class="col-xs-9">
                <input type="text" class="form-control" id="inputName" placeholder="생년월일">
              </div>
            </div>
            <div class="form-group">
              <label for="inputNumber" class="col-xs-2 control-label">휴대폰번호</label>
              <div class="col-xs-9">
                <input type="text" class="form-control" id="inputNumber" placeholder="휴대폰번호">
                <p class="help-block">- 없이 적어주세요.</p>
              </div>

            </div>

            <div class="form-group">
              <label for="inputAgree" class="col-xs-2 control-label">약관 동의</label>
              <div class="col-xs-9 checkbox">
                <label>
                  <input id="agree" type="checkbox">이용약관에 동의합니다.
                </label>
                <textarea readonly class="form-control" name="name" rows="8" cols="80">본 약관 중요사항 고지는 인터파크 이용약관에 포함된 인터파크,이용자,제공서비스,개인정보 보호정책, 회원탈퇴에 대한 정의를 요약한 것으로 이용약관에 따른 구체적인 권리관계 및 의무사항은 반드시 전문보기를 확인하고 동의를 진행 하여야 합니다.

[Ticket Sky]
Ticket Sky란 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장(www.interpark.com 또는 www.interpark.co.kr)을 말하며, 아울러 사이버 몰을 운영하는 사업자의 의미로도 사용합니다. 단, 아이포인트몰, 마트/할인점, 도서, 공연/영화 및 쇼핑에 한하며 다른 탭의 영업장 및 www.playdb.co.kr은 제외합니다.

[제공 서비스]
1.쇼핑서비스(오픈마켓 서비스 포함)
2. 도서서비스(회사와 별도약정으로 한 공급자의 직접배송 서비스 포함)
3. 티켓예매서비스 또는 ENT서비스
4. 여행 서비스(개정 2009.09.01)
5. 기타 회사가 정하는 업무 등

[이용자]
"이용자"라 함은 회사에 접속하여 이 약관에 따라 회사가 제공하는 서비스를 받는 회원 및 비회원을 말합니다. 이용자는 회사가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청하고, 회사는 회원으로 가입할 것을 신청한 이용자 중 약관에 따라 허용가능한 이용자는 회원으로 승낙합니다.

[개인정보 보호정책]
인터파크는 이용자의 정보수집 시 판·구매 계약 이행에 필요한 최소한의 정보를 수집하는 바
다음 사항을 필수사항으로 하며 그 외 사항은 관련법령 및 개인정보처리방침을 따릅니다.

가. 성명, 생년월일
나. 휴대전화번호
다. 아이디ID(회원의 경우)
라. 비밀번호(회원의 경우)
마. E-mail 주소(회원의 경우)

[회원 탈퇴]
(회원 탈퇴 및 자격 상실 등)
회원은 회사에 언제든지 탈퇴를 요청할 수 있으며 회사는 즉시 회원탈퇴를 처리합니다. 다만, 해지의사를 통지하기 전에 모든 상품의 판매 및 구매 절차를 완료, 철회 또는 취소해야만 합니다. 이 경우 판매 및 구매의 철회 또는 취소로 인한 불이익은 회원 본인이 부담하여야 하며 기타 법령에 위반되거나, 사회통념,공서양속에 위배되는 경우 회원 자격제한, 정지 조치될 수 있습니다.</textarea>
              </div>
            </div>
            <div class="form-group">
              <label for="inputName" class="col-sm-2 control-label"></label>
              <div class="col-xs-9">
                <button type="submit" class="btn btn-lg btn-primary">회원가입</button>
              </div>
            </div>
          </form>
      </div> <!-- container -->
    </section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>