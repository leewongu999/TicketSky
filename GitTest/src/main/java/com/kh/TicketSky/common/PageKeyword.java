package com.kh.TicketSky.common;

public class PageKeyword {
	public String getPage(int cPage, int numPerPage, int totalContents, String url) {
		String pageBar = "";			// 페이지 바를 만들 자바스크립트 태그 작성
		int pageBarSize = 10;			// 한 페이지당 페이지 바의 최대 길이를 10으로 설정
		
		// 전체 게시글을 담는 데 필요한 페이지의 개수
		// 여기서는 한 페이지당 최대 게시글의 수를 10개로 설정하기 위해
		// numPerPage의 값을 10으로 고정했다.
		int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
		// 페이지 바에서 제일 왼쪽에 있는 노드의 번호(여기서 노드의 번호는 항상 일의 자리의 숫자가 1이다.)
		int pageStart = ((cPage-1)/pageBarSize)*pageBarSize+1;
		// 페이지 바에서 제일 오른쪽에 있는, 노드의 마지막 번호(여기서 노드의 번호는 항상 10의 배수다.)
		int pageEnd = cPage+pageBarSize-1;
		
		pageBar += "<ul>";				// 열기 태그
		// 페이지 바 디자인
		// 먼저 페이지 바 왼쪽 부분
		if(pageStart==1) {				// 1페이지일 때
			pageBar += "<li class='xet_btn medium'><span>&laquo;</span></li>";
		}else{							// 그 외 페이지일 때
			pageBar += "<li class='xet_btn medium'>";
			pageBar += "<a href='javascript:fn_paging("+(pageStart-1)+")'>&laquo</a>";
			pageBar += "</li>";
		}
		// 페이지 바 노드 번호 부여 부분
		// 해당 페이지의 노드 번호가 한 페이지 바 내의 노드 번호 끝까지 가거나, 마지막 페이지 번호로 가는 동안 진행되는 로직
		while(pageStart<=pageEnd && pageStart<=totalPage) {
			if(cPage==pageStart) {				// 현재 위치한 페이지가 해당 페이지 노드 번호에 있을 때
				pageBar += "<li class='xet_btn medium'><a>"+pageStart+"</a></li>";
			}else {								// 그 외의 노드 번호 처리
				pageBar += "<li class='xet_btn medium'>";
				pageBar += "<a href='javascript:fn_paging("+pageStart+")'>"+pageStart+"</a>";
				pageBar += "</li>";
			}
			pageStart++;	// 반복문이기 때문에, 끝까지 가서 조건문을 빠져나오기 위해서는 이 증감식을 꼭 써야 한다.
		}
		// 페이지 바 오른쪽(끝나는 부분)
		if(pageStart>totalPage) {	// 마지막 페이지까지 갔을 때
			pageBar += "<li class='xet_btn medium'><span>&raquo;</span></li>";
		}else{						// 마지막 페이지까지 가지 않았을 때
			pageBar += "<li class='xet_btn medium'>";
			pageBar += "<a href='javascript:fn_paging("+pageStart+")'>&raquo;</a>";
			pageBar += "</li>";
		}
		pageBar += "</ul>";				// 닫기 태그
		pageBar += "<script>";
		pageBar += "function fn_paging(cPage){";
		pageBar += "location.href='"+url+"?cPage='+cPage";
		pageBar += "}";
		pageBar += "</script>";
		return pageBar;
	}
}
