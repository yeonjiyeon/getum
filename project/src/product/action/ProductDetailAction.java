package product.action;
import java.util.Map;

import javax.servlet.*;
import javax.servlet.http.*;

import member.*;
import product.*;
import gettum.action.CommandAction;
public class ProductDetailAction implements CommandAction{

	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		String code=request.getParameter("code");
		
		ProductDAO dao=ProductDAO.getInstance();
		ProductDto dto=dao.getDetails(code);
		
		String id=request.getParameter("id");
		String passwd=request.getParameter("passwd");
		
		LoginDao ldao=LoginDao.getInstance();
		Map map=(ldao).userCheck(id, passwd);
		
		request.setAttribute("id", id);
		
		
		request.setAttribute("code", code);
		request.setAttribute("dto", dto);
		return "/product/productDetail.jsp";
	}

}
