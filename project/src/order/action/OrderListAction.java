package order.action;
import java.util.Collections;
import java.util.Vector;

import javax.servlet.*;
import javax.servlet.http.*;

import order.OrderDao;
import gettum.action.CommandAction;
public class OrderListAction implements CommandAction{

	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		Vector oVec=null;
		//String userid=(String)oVec.get(userid);
		
		OrderDao odao=new OrderDao();
		//oVec=odao.getOrder(userid);
		
		request.setAttribute("oVec", oVec);
		return "/order/orderList.jsp";
	}

}
