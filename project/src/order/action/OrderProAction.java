package order.action;
import gettum.action.CommandAction;

import javax.servlet.*;
import javax.servlet.http.*;

import product.ProductDAO;
import order.*;

import java.util.*;
public class OrderProAction implements CommandAction{

	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		
		//처리
		//hCart
		product.ProductDAO proDao=ProductDAO.getInstance();//dao 객체얻기
		CartDao cartDao=new CartDao();
		OrderDao orderDao=new OrderDao();
		
		//Hashtable hCart = cartDao.getCartList();//cart내용 가져오기
		Hashtable hCart = (Hashtable) request.getSession().getAttribute("hCart");
		Enumeration hCartKey=hCart.keys();//해쉬테이블의 키값들얻기

		if(hCart.size() != 0){//장바구니에 내용이 있으면
			 while(hCartKey.hasMoreElements()){
				 OrderDto order=(OrderDto)hCart.get(hCartKey.nextElement());
				 
				 orderDao.insertOrder(order);// 주문 테이블에 저장 dao메서드호출
				 proDao.reduceProduct(order);// 남은 물량 계산 dao메서드호출
				 cartDao.deleteCart(order); // 장바구니 비운다 
			 }//while end--
			 
			 
//			System.out.println("<script>");
//			System.out.println("alert('주문처리 하였습니다')");
//			System.out.println("location.href='OrderList.jsp'");
//			System.out.println("</script>");
	 		
//			request.setAttribute("msg","주문처리 하였습니다");
//			request.setAttribute("url","location.href='OrderList.jsp'");
			
		}else{//장바구니 내용이 없으면
//			System.out.println("<script>");
//			System.out.println("alert('장바구니가 비어있습니다.')");
//			System.out.println("location.href='ProductList.jsp'");
//			System.out.println("</script>");
//			
//			request.setAttribute("msg","장바구니가 비어있습니다.");//${msg}
//			request.setAttribute("url","location.href='ProductList.jsp'");//${url}
		}//else--
		
		request.setAttribute("hCart", hCart);
		return "/order/orderPro.jsp";
	}

}
