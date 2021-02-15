package notice.action;
import gettum.action.CommandAction;

import javax.servlet.*;
import javax.servlet.http.*;

import notice.*;

public class NdeleteProAction implements CommandAction{

	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
request.setCharacterEncoding("utf-8");
		
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		String passwd=request.getParameter("passwd");
		
		NoticeDao dao=NoticeDao.getInstance();//dao객체 얻기 
		int check=dao.deleteArticle(num, passwd);//dao메서드 호출
		
		//해당 뷰에서 사용학 속성
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("check", check);
		
		return "/notice/ndeletePro.jsp";//뷰 리턴
	}

}
