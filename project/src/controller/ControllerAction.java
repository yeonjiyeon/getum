package controller;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;//properties 파일 읽어 오려고
import java.util.*;//Map,HashMap
import gettum.action.CommandAction;//인터페이스

//컨트롤러는 서블릿으로 만든다 
public class ControllerAction extends HttpServlet{
	private Map<String,Object> map=new HashMap<String,Object>();//변수, 객체 생성
	
	//init() 초기화 작업 
	public void init(ServletConfig config) throws ServletException{
		String path=config.getServletContext().getRealPath("/");
		
		String pros=path+config.getInitParameter("proFile");///WEB-INF/CommandPro.properties
		Properties pp=new Properties();//객체 생성
		
		FileInputStream fn=null;
		try{
			fn=new FileInputStream(pros);
			pp.load(fn);
			
		}catch(Exception ex1){
			System.out.println("파일읽기 예외:"+ex1);
		}finally{
			try{
				fn.close();
			}catch(Exception ex2){}
		}//finally end
		
		Iterator keys=pp.keySet().iterator();//properties의 모든 키를 받는다
		
		while(keys.hasNext()){//자료가 있는 동안 반복 수행
			/*
			 /ch19/list.do=ch19.action.ListAction
			 */
			String kkey=(String)keys.next();// /ch19/list.do
			String className=pp.getProperty(kkey);//ch19.action.ListAction
			
			try{
				Class commandClass=Class.forName(className);//클래스를 만들고
				Object commandObject=commandClass.newInstance();//객체를 만든다
				
				map.put(kkey, commandObject);//map.put(key,value)
				
			}catch(Exception ex3){
				System.out.println("property파일 내용을 클래스객체를 만드는 동안 예외발생:"+ex3);
			}
		}//while end
	}//init() end
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		reqPro(request,response);//메서드 호출
	}//doGet() end
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
			reqPro(request,response);//메서드 호출		
			}//doPost() end
	
	//사용자 정의 메서드
	private void reqPro(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		String view="";//jsp넣을 변수
		
		CommandAction commandAction=null;//Action을 넣을 변수
		
		try{
			String uri=request.getRequestURI();// /프로젝트이름/ch19/list.do
			if(uri.indexOf(request.getContextPath())==0){//프로젝트이름얻기
				uri=uri.substring(request.getContextPath().length());
				// /ch19/list.do
			}//if end
			commandAction=(CommandAction)map.get(uri);
			
			view=commandAction.requestPro(request, response);//메서드를 호출하여 view를 얻는다 
			//list.jsp
			
			}catch(Throwable ex7){
			throw new ServletException(ex7);//예외 생성
		}//catch end
		
		//view로 포워딩 작업
		request.setAttribute("CONTENT",view);
		RequestDispatcher rd=request.getRequestDispatcher("/template/template.jsp");
		rd.forward(request, response);//view(list.jsp)로 포워딩한다
	}//reqPro() end
}//class end
