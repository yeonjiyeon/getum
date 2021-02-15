package member.action;
import javax.servlet.http.*;

import gettum.action.CommandAction;
public class LogoutAction implements CommandAction{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable{
		return "/member/logout.jsp";
	}

}
