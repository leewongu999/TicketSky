package com.kh.ticketsky.common;

public class Page {
	
	public static String getPage(int cPage, int numPerPage, int totalContents, String url)
	{
		String pageBar="";
		int pageBarSize=5;
		
		int totalPage=(int)Math.ceil((double)totalContents/numPerPage);
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		pageBar+="<ul class='pagination justify-content-center pagination-sm'  style=\"margin:auto;\">";
		
		if(pageNo==1)
		{
			pageBar+="<li class='page-item disabled' style=\"margin:0;\">";
			pageBar+="<a class='page-link' href='#' tabindex='-1'><span aria-hidden=\"true\">&laquo;</span></a>";
			pageBar+="</li>";
		}
		else
		{
			pageBar+="<li class='page-item' style=\"margin:0;\">";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'><span aria-hidden=\"true\">&laquo;</span></a>";
			pageBar+="</li>";		
		}
		
		while(!(pageNo>pageEnd || pageNo>totalPage))
		{
			if(cPage==pageNo)
			{
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			else
			{
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		if(pageNo>totalPage)
		{
			pageBar+="<li class='page-item' style=\"margin:0;\">";
			pageBar+="<a class='page-link' href='#'> <span aria-hidden=\"true\">&raquo;</span></a>";
			pageBar+="</li>";
		}
		else
		{
			pageBar+="<li class='page-item' style=\"margin:0;\">";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'> <span aria-hidden=\"true\">&raquo;</span></a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage,numPerPage){";
		pageBar+="location.href='"+url+"?cPage='+cPage;";
		pageBar+="}";
		pageBar+="</script>";
		return pageBar;
	}

}
