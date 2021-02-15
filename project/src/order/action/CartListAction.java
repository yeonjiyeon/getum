package order.action;
import gettum.action.CommandAction;

import java.util.Collections;
import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.CartDao;
import order.OrderDto;
public class CartListAction implements CommandAction{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		OrderDto orderDto=new OrderDto();
		CartDao cdao=new CartDao();
		
		
		//Hashtable hCart=cdao.getCartList();
		Hashtable hCart = (Hashtable) request.getSession().getAttribute("hCart");
		
		request.getSession().setAttribute("hCart", hCart);
								
		return "/order/cartList.jsp";
	}
	
}//class end
