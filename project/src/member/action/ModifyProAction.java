package member.action;
import javax.servlet.http.*;

import member.*;
import gettum.action.CommandAction;
public class ModifyProAction implements CommandAction{

	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
			
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		
		LoginDto dto=new LoginDto();
		dto.setPasswd(request.getParameter("passwd"));
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		
		dto.setId(request.getParameter("id"));
		
		dto.setZipcode(request.getParameter("zipcode"));
		
		String m_addr=request.getParameter("addr")+"_"+request.getParameter("addr2");
		
		dto.setAddr(m_addr);
		
		
		LoginDao dao=LoginDao.getInstance();
		dao.updateMember(dto);
		
		request.setAttribute("id", id);
		return "/member/modifyPro.jsp";
	}

}//class end
