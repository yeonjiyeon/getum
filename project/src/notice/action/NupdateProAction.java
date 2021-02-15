package notice.action;
import gettum.action.CommandAction;

import javax.servlet.*;
import javax.servlet.http.*;

import notice.*;

public class NupdateProAction implements CommandAction{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String pageNum=request.getParameter("pageNum");
		
		NoticeDto dto=new NoticeDto();
		
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setWriter(request.getParameter("writer"));
		
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPasswd(request.getParameter("passwd"));
		
		NoticeDao dao=NoticeDao.getInstance();
		
		int check=dao.updateArticle(dto);
		
		request.setAttribute("check", new Integer(check));
		request.setAttribute("pageNum", new Integer(pageNum));
		
		return "/notice/nupdatePro.jsp";
	}

}//class
