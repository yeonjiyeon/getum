package member.action;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gettum.action.*;
public class LoginFormAction implements CommandAction{


	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		return "/member/loginForm.jsp";//∫‰∏Æ≈œ
	}//requestPro end

}//class
