package notice.action;
import javax.servlet.*;
import javax.servlet.http.*;
import gettum.action.CommandAction;
public class NdeleteFormAction implements CommandAction{

	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		
		//해당뷰에서 사용할 속성
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", pageNum);

		return "/notice/ndeleteForm.jsp";
	}

}
