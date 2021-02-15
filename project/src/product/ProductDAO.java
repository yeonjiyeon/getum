package product;
import java.sql.*;
import java.util.*;

import javax.sql.*;
import javax.naming.*;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.*;

import order.OrderDto;

import java.io.*;
public class ProductDAO {
	private ProductDAO(){}
	
	private static ProductDAO instance=new ProductDAO();
	
	public static ProductDAO getInstance(){
		return instance;
	}//getInstance() end
	
	private Connection getCon() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}//getCon() end
	

	  //------------------
	  //1.상품목록 리스트
	  //------------------
	public List getGoodList() throws Exception{
		String sql="";
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		List<ProductDto> goodList=new ArrayList<ProductDto>();
		try{
			con=getCon();
			sql="select*from product";
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next()){
				ProductDto dto=new ProductDto();
				
				dto.setPro_no(rs.getInt("pro_no"));
				dto.setCode(rs.getString("code"));
				dto.setName(rs.getString("name"));
				
				dto.setPrice(rs.getInt("price"));
				dto.setStock(rs.getInt("stock"));
				
				dto.setDetail(rs.getString("detail"));
				
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setImage(rs.getString("image"));
				
				goodList.add(dto);
			}//while end
		}catch(Exception ex1){
			System.out.println("getGoodList() 예외 :"+ex1);
		  }finally{
			  try{
		    		if(rs!=null){rs.close();}
		    		if(stmt!=null){stmt.close();}
		    		if(con!=null){con.close();}
		    	}catch(Exception ex2){}
		  }//finally end
			return goodList;
	}//getGoodList() end
	
	  //---------------
	  //상세보기
	  //---------------
	public ProductDto getDetails(String code) throws Exception{
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		String sql="";
		ProductDto dto=new ProductDto();		
		try{
			con=getCon();
			stmt=con.createStatement();
			sql="select * from product where code='"+code+"'";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()){
				dto.setPro_no(rs.getInt("pro_no"));
				dto.setCode(rs.getString("code"));
				dto.setName(rs.getString("name"));
				
				dto.setPrice(rs.getInt("price"));
				dto.setStock(rs.getInt("stock"));
				
				dto.setDetail(rs.getString("detail"));
				
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setImage(rs.getString("image"));
			}//while end
		}catch(Exception ex){
			System.out.println("getDetails() 예외:"+ex);
	    }finally{
	    
	    	try{
	    		if(rs!=null){rs.close();}
	    		if(stmt!=null){stmt.close();}
	    		if(con!=null){con.close();}
	    	}catch(Exception ex2){}	    	
	     }//finally end		    
	    return dto;
	  }//getDetails() end
	
	  //---------------------------
	  //3. pro_no정보 : 상품 일련번호,update에서사용
	  //---------------------------
	public ProductDto getProduct(String code,int pro_no){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		ProductDto dto=null;
		String sql=null;
		
		try{
			con=getCon();
			sql="select * from product where pro_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pro_no);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				dto=new ProductDto();
				dto.setPro_no(rs.getInt("pro_no"));
				dto.setCode(rs.getString("code"));
				dto.setName(rs.getString("name"));
				
				dto.setPrice(rs.getInt("price"));
				dto.setStock(rs.getInt("stock"));
				
				dto.setDetail(rs.getString("detail"));
				
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setImage(rs.getString("image"));
			}//while end
		}catch(Exception ex){
			  System.out.println("getProduct() 예외 :"+ex);
		  }finally{
			  try{
					if(rs!=null){rs.close();}
			    	if(pstmt!=null){pstmt.close();}
			    	if(con!=null){con.close();}  
				}catch(Exception ex2){}
		  }//finally ---
		  
		  return dto;
	  }//getProduct() end
	
	  //-----------------------------------------------
	  //4.남은 물량 계산
	  //-----------------------------------------------
	public void reduceProduct(OrderDto order){
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try{
			con=getCon();
			String sql="update product set stock=(stock-?) where pro_no=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, order.getQuantity());
			pstmt.setInt(2,order.getPro_no());
			
			pstmt.executeUpdate();
		  }catch(Exception ex){
			  System.out.println("reduceProduct() 예외 :"+ex);
		  }finally{			  
			  try{
			    	if(pstmt!=null){pstmt.close();}
			    	if(con!=null){con.close();}
			  }catch(Exception ex){}		
		  }//finally end		  
	  }//reduceProduct() end 
	  
	 //---------------------------------		
	 //insert :상품 등록 ( 관리자 하는 일)
	 //---------------------------------

}//class end
