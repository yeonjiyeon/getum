package order;
import java.sql.*;

import java.util.Vector;

import javax.sql.*;
import javax.naming.*;

import member.LoginDao;

public class OrderDao {
	
	public OrderDao(){}
	
	public Connection getCon() throws Exception{
		Context ct=new InitialContext();		
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}//getCon() end
	
	//-------------
	//1. 주문
	//-------------
	public void insertOrder(OrderDto dto) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=getCon();
			String sql="insert into g_order(ordno,m_id,pro_no,quantity,orddate,state) values(order_seq.nextval,?,?,?,sysdate,?)";
			
			pstmt=con.prepareStatement(sql);
						
			pstmt.setString(1,dto.getM_id());
			pstmt.setInt(2, dto.getPro_no());
			pstmt.setString(3, dto.getQuantity());
			pstmt.setString(4, "1");
			
			pstmt.executeUpdate();
			
		}catch(Exception ex1){
			System.out.println("OrderDao.insertOrder() 예외:"+ex1);
		}finally{
			try {
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch (Exception e2) {}
		}//finally end
	}//insertOrder() end
	
	//----------------------------------
	//2. m_id(한명의 클라이언트)에 해당하는 주문 목록얻기
	//----------------------------------
	public Vector<OrderDto> getOrder(String m_id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		Vector<OrderDto> vec=new Vector<OrderDto>();
		
		try{
			con=getCon();
			sql="select * from g_order where m_id=? order by ordno desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs=pstmt.executeQuery();
			
			OrderDto dto=null;
			while(rs.next()){
				dto=new OrderDto();				
				dto.setM_id(rs.getString("m_id"));
				dto.setQuantity(rs.getString("quantity"));
				dto.setOrddate(rs.getTimestamp("orddate"));
				dto.setState(rs.getString("state"));
				dto.setPro_no(rs.getInt("pro_no"));
				vec.add(dto);
			}//while end
		}catch(Exception ex1){			
			System.out.println("getOrder() 예외 :"+ex1);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally end
		return vec;
	}//getOrder() end
	
	//----------------------------------
	// 3.모든 주문 정보 
	//----------------------------------
	public Vector getOrderList(){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		Vector<OrderDto> vec=new Vector<OrderDto>();
		OrderDto dto=null;
		String sql="";
		
		try{
			con=getCon();
			 sql="select * from g_order where m_id=? order by ordno desc";
			 stmt=con.createStatement();
			 rs=stmt.executeQuery(sql);
			 
			 while(rs.next()){
				 dto=new OrderDto();
				 
				 dto.setM_id(rs.getString("m_id"));
				 dto.setQuantity(rs.getString("quantity"));
				 dto.setOrddate(rs.getTimestamp("orddate"));
				 dto.setOrdno(rs.getInt("ordno"));
				 dto.setState(rs.getString("state"));
				 dto.setPro_no(rs.getInt("pro_no"));
				 
				 vec.add(dto);
			 }//while
		}catch(Exception ex1){
			System.out.println("getOrderList() 에외:"+ex1);
		}finally{
			try{
				if(rs!=null){rs.close();}
				if(stmt!=null){stmt.close();}
				if(con!=null){con.close();}
			}catch(Exception ex2){}
		}//finally end
		return vec;
	}//getOrderList() end	
}//class end
