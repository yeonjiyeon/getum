package member.action;
import javax.servlet.http.*;

import gettum.action.CommandAction;
import member.*;

import java.sql.Timestamp;
public class InputProAction implements CommandAction{

	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		LoginDto dto=new LoginDto();
		String id=request.getParameter("id");
		
		//dto¿¡ setterÀÛ¾÷
		dto.setId(request.getParameter("id"));
		dto.setPasswd(request.getParameter("passwd"));
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		
		dto.setZipcode(request.getParameter("zipcode"));
		
		String m_addr=request.getParameter("addr")+"_"+request.getParameter("addr2");
		
		dto.setAddr(m_addr);
		
		dto.setRegdate(new Timestamp(System.currentTimeMillis()));
		
		LoginDao dao=LoginDao.getInstance();
		dao.insertMember(dto);
		
		request.setAttribute("id", id);
		return "/member/inputPro.jsp";
	}//requestPro() end---

}//class end
