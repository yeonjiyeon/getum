package member.action;
import javax.servlet.http.*;

import gettum.action.CommandAction;
import member.*;
public class DeleteProAction implements CommandAction{

	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
			String id=request.getParameter("id");
			String passwd=request.getParameter("passwd");
			
			LoginDao logindao=LoginDao.getInstance();
			int check=logindao.deleteMember(id, passwd);
			
			request.setAttribute("check", new Integer(check));
		return "/member/deletePro.jsp";
	}

}//class end
