package product.action;
import javax.servlet.http.*;

import product.ProductDAO;
import product.ProductDto;

import java.util.*;

import gettum.action.CommandAction;
public class ProductListAction implements CommandAction{	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {	

		List productList=null;
		ProductDAO dao=ProductDAO.getInstance();
		productList=dao.getGoodList();

		if(productList.isEmpty()){//상품이 없으면 			
			productList=Collections.EMPTY_LIST;
		}else{//상품이 있으면 
			productList=dao.getGoodList();
		}
		request.setAttribute("productList", productList);
		return "/product/productList.jsp";
	}

}//class end

