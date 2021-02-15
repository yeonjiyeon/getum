package member.action;
import javax.servlet.*;
import javax.servlet.http.*;

import gettum.action.CommandAction;

public class InputFormAction implements CommandAction{

	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		return "/member/inputForm.jsp";
	}//requestPro end

}//class end
