package notice.action;
import gettum.action.CommandAction;

import javax.servlet.*;
import javax.servlet.http.*;

import notice.*;
public class NwriteProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		NoticeDto dto=new NoticeDto();
		
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setWriter(request.getParameter("writer"));
		dto.setSubject(request.getParameter("subject"));
		dto.setPasswd(request.getParameter("passwd"));
		dto.setContent(request.getParameter("content"));
		
		dto.setRef(Integer.parseInt(request.getParameter("ref")));
		dto.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		dto.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		
		dto.setIp(request.getRemoteAddr());
		
		NoticeDao dao=NoticeDao.getInstance();
		dao.insertArticle(dto);
		return "/notice/nwritePro.jsp";
	}

}
