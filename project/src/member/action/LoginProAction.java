package member.action;
import javax.servlet.http.*;

import gettum.action.CommandAction;
import member.*;
import java.util.*;
public class LoginProAction implements CommandAction{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String passwd=request.getParameter("passwd");
		
		LoginDao dao=LoginDao.getInstance();
		Map map=dao.userCheck(id, passwd);
		
		Integer check=(Integer)map.get("x");
		String name=(String)map.get("name");
		
		request.setAttribute("check", check);
		request.setAttribute("id", id);
		//request.setAttribute("memId", id);
		request.setAttribute("memName", name);
		
		request.getSession().setAttribute("id", id);
		return "/member/loginPro.jsp";
	}

}//class end
