package notice.action;
import gettum.action.CommandAction;
import javax.servlet.http.*;
import java.util.*;
import notice.*;

public class NlistAction implements CommandAction{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		String pageNum=request.getParameter("pageNum");//페이지를 받아서 
		if(pageNum==null){//페이지가 없으면 1 로한다 
			pageNum="1";
		}
		int pageSize=10;
		int currentPage=Integer.parseInt(pageNum);
		
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		
		int count=0;//글 갯수 
		int number=0;//글 그룹처리하려고 , 글 그룹번호
		int pageBlock=10;
		
		List articleList=null;
		NoticeDao dao=NoticeDao.getInstance();
		count=dao.getArticleCount();
		
		if(count>0){
			articleList=dao.getList(startRow, pageSize);
		}else{
			articleList=Collections.EMPTY_LIST;
		}//else
		
		number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("pageBlock", new Integer(pageBlock));
		request.setAttribute("pageCount", new Integer(pageCount));
		
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("articleList", articleList);
		return "/notice/nlist.jsp";
	}

}
