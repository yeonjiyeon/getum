package member;
import java.sql.*;

import javax.sql.*;//커넥션풀, DataSource
import javax.naming.*;//lookup
import java.util.*;
//Dao: 비지니스 로직
public class LoginDao {
	private static LoginDao instance=new LoginDao();//객체 생성
	
	//jsp에서 사용할 메서드 예:LoginDao.getInstance();
	public static LoginDao getInstance(){
		return instance;
	}//getInstance() end
	
	private LoginDao(){}//디폴트 생성자--> 외부에서 사용X
	
	//커넥션풀 사용하는 메서드 정의
	private Connection getCon() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}//getCon() end
	
	//id중복체크
	public int confirmId(String id) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int x=-1;
		try{
			con=getCon();
			pstmt=con.prepareStatement("select id from member where id=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				x=1;//이미 존재하는 아이디입니다
			}else{
				x=-1;//사용 가능한 아이디입니다
			}
		}catch(Exception ex1){
			System.out.println("confirmId() 예외:"+ex1);
		}finally{
			try{
				if(rs !=null){rs.close();}
				if(pstmt !=null){pstmt.close();}
				if(con !=null){con.close();}
			}catch(Exception ex2){}
		}//finally end
		
		return x;
	}//confirmId() end
	
	//---------------------
    //회원 가입
    //---------------------
	public void insertMember(LoginDto dto)throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("insert into member values(?,?,?,?,?,?,?)");
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getZipcode());
			pstmt.setString(6, dto.getAddr());
			pstmt.setTimestamp(7, dto.getRegdate());
			
			pstmt.executeUpdate();
			
		}catch(Exception ex1){
			System.out.println("insertMember()예외:"+ex1);
		}finally{
			try{
				if(pstmt !=null){pstmt.close();}
				if(con !=null){con.close();}
			}catch(Exception ex2){}
		}
	}//insertMember() end
	//----------------
    //로그인(인증)
    //----------------
	public Map userCheck(String id,String passwd)throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String dbPasswd="";
		int x=-1;
		String name="";
		Map<String,Object> map=new HashMap<String,Object>();
		try{
			con=getCon();
			pstmt=con.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dbPasswd=rs.getString("passwd");
				 name=rs.getString("name");
				if(passwd.equals(dbPasswd)){
					x=1;
					map.put("x",new Integer(x));
					map.put("name", name);
				}else{
					x=0;
					map.put("x",new Integer(x));
					map.put("name", name);
				}
			}else{
				x=-1;
				map.put("x",new Integer(x));
				map.put("name", name);
			}
		}catch(Exception ex1){
			System.out.println("userCheck() 예외:"+ex1);
		}finally{
			try{
				if(rs !=null){rs.close();}
				if(pstmt !=null){pstmt.close();}
				if(con !=null){con.close();}
			}catch(Exception ex2){}
		}//finally end
		
		return map;
	}//userCheck() end

	//----------------------------
	//회원정보 수정 : 웹으로 보낼 것을 처리
	//----------------------------
	public LoginDto getMember(String id)throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		LoginDto dto=null;
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("select * from member where id='"+id+"'");
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new LoginDto();
				
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddr(rs.getString("addr"));
				dto.setRegdate(rs.getTimestamp("regdate"));			
			}//if end
			
		}catch(Exception ex1){
			System.out.println("getMember() 예외:"+ex1);
		}finally{
			try{
				if(rs !=null){rs.close();}
				if(pstmt !=null){pstmt.close();}
				if(con !=null){con.close();}
			}catch(Exception ex2){}
		}//finally() end
		
		return dto;
	}//getMember() end
	//-----------------
	//DB 회원정보 수정 
	//-----------------
	public void updateMember(LoginDto dto)throws Exception{
		//System.out.println("암호:"+dto.getPasswd());
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=getCon();
			String sql="update member set passwd=?, name=?, email=?, zipcode=?, addr=? where id=?";
			pstmt=con.prepareStatement(sql);//생성시 인자 들어간다
			
			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getZipcode());
			pstmt.setString(5, dto.getAddr());
			pstmt.setString(6, dto.getId());
			
			pstmt.executeUpdate();
			
		}catch(Exception ex1){
			System.out.println("updateMember() 예외:"+ex1);
		}finally{
			try{
				if(pstmt !=null){pstmt.close();}
				if(con !=null){con.close();}
			}catch(Exception ex2){}
		}
	}//updateMember() end

	//------------------
	//회원탈퇴	
	//------------------
	
	public int deleteMember(String id,String passwd)throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		
		String dbPasswd="";
		int x=-1;
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("select passwd from member where id=?");
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){//로그인했을때
				dbPasswd=rs.getString("passwd");
				if(dbPasswd.equals(passwd)){//암호가 일치하면 삭제
					pstmt2=con.prepareStatement("delete from member where id=?");
					pstmt2.setString(1, id);
					pstmt2.executeUpdate();
					x=1;//탈퇴 성공
				}else{
					x=-1;//암호 틀림
				}
			}else{
				x=0;//아이디가 없음
			}
		}catch(Exception ex1){
			System.out.println("deleteMember() 예외:"+ex1);
		}finally{
			try{
				if(rs !=null){rs.close();}
				if(pstmt !=null){pstmt.close();}
				if(pstmt2 !=null){pstmt2.close();}
				if(con !=null){con.close();}
			}catch(Exception ex2){}
		}//finally() end		
		return x;
		
	}//deleteMember() end
	
}//class end
