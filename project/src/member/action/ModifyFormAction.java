package member.action;
import javax.servlet.http.*;

import member.*;
import gettum.action.CommandAction;
public class ModifyFormAction implements CommandAction{

	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		String id=request.getParameter("id");
		
		LoginDao dao=LoginDao.getInstance();
		LoginDto dto= dao.getMember(id);
		
		String m_addr=dto.getAddr();
		int idx=m_addr.indexOf('_');
		String addr=m_addr.substring(0,idx);
		String addr2=m_addr.substring(idx+1);
		
		request.setAttribute("addr", addr);
		request.setAttribute("addr2", addr2);
		
		request.setAttribute("dto", dto);
		return "/member/modifyForm.jsp";
	}

}
