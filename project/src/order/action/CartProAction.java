package order.action;
import javax.servlet.http.*;

import order.OrderDto;
import member.LoginDto;
import product.ProductDto;
import gettum.action.CommandAction;
public class CartProAction implements CommandAction{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		
	
	
		
		return "/order/cartPro.jsp";
	}

}//class end
