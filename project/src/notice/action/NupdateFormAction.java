package notice.action;
import gettum.action.CommandAction;

import javax.servlet.*;
import javax.servlet.http.*;

import notice.*;

public class NupdateFormAction implements CommandAction{
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
			int num=Integer.parseInt(request.getParameter("num"));
			String pageNum=request.getParameter("pageNum");
			
			NoticeDao dao=NoticeDao.getInstance();
			NoticeDto dto=dao.updateGetArticle(num);
			
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("dto", dto);
		return "/notice/nupdateForm.jsp";
	}

}
