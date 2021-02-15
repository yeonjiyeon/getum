package member.action;
import javax.servlet.http.*;

import gettum.action.CommandAction;

public class ModifyAction implements CommandAction{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		return "/member/modify.jsp";
	}//requestPro end

}//class end
