package notice;

import java.sql.*;
import java.util.*;

import javax.sql.*;
import javax.naming.*;
public class NoticeDao {
	private static NoticeDao instance=new NoticeDao();
	
	public static NoticeDao getInstance(){
		return instance;
	}//getInstance
	
	private NoticeDao(){}
	
	//커넥션 얻기
	private Connection getCon() throws Exception{
		Context ct=new InitialContext();
		DataSource ds=(DataSource)ct.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}//getCon()
	
	//----------------
    // 원글,답글 쓰기 
    //----------------
	public void insertArticle(NoticeDto dto) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		
		int num=dto.getNum();
		int ref=dto.getRef();
		int re_step=dto.getRe_step();
		int re_level=dto.getRe_level();
		
		int number=0;//글 그룹처리하려고 , 글 그룹번호
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("select max(num) from notice");
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				number=rs.getInt(1)+1;
			}else{
				number=1;
			}//else
			
			if(num != 0){
				sql="update notice set re_step=re_step+1 where ref=? and re_step>?";
				pstmt=con.prepareStatement(sql);
				
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				
				re_step=re_step+1;
				re_level=re_level+1;
			}else{
				ref=number;
				re_step=0;
				re_level=0;
			}//else end
			
			sql="insert into notice(num,writer,subject,passwd,regdate,ref,re_step,"
					+ "re_level,content,ip) values(notice_seq.nextval,?,?,?,sysdate,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getPasswd());
			
			pstmt.setInt(4, ref);
			pstmt.setInt(5, re_step);
			pstmt.setInt(6, re_level);
			
			pstmt.setString(7, dto.getContent());
			pstmt.setString(8, dto.getIp());
			
			pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("insertArticle() 예외발생:"+ex);
		}finally{
			try{
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
				if(con != null){con.close();}				
			}catch(Exception ex2){}
		}//finally end
	}//insertArticle() end
		
	//----------------
    // 글 갯수
    //----------------
	public int getArticleCount() throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int x=0;
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("select count(*) from notice");
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				x=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("getArticleCount() 예외발생:"+ex);
		}finally{
			try{
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
				if(con != null){con.close();}				
			}catch(Exception ex2){}
		}//finally end
		
		return x;
	}//getArticleCount() end
		
	//----------------
    // 리스트
    //----------------
	public List getList(int start, int cnt)throws Exception{
		List<NoticeDto> list=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		
		try{
			con=getCon();
			sql="select * from(select rownum rnum,num,writer,subject,passwd,regdate,readcount,ref,re_step,re_level,content,ip from(select * from notice order by ref desc,re_step asc)) where rnum>=? and rnum<?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, start+cnt);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				list=new ArrayList<NoticeDto>();
				do{
					NoticeDto dto=new NoticeDto();
					
					dto.setNum(rs.getInt("num"));
					dto.setWriter(rs.getString("writer"));
					dto.setSubject(rs.getString("subject"));
					dto.setPasswd(rs.getString("passwd"));
					dto.setRegdate(rs.getTimestamp("regdate"));				
					//System.out.println("날짜"+rs.getDate("regdate"));
					System.out.println("날짜"+rs.getTimestamp("regdate"));
					dto.setReadcount(rs.getInt("readcount"));
					dto.setRef(rs.getInt("ref"));
					dto.setRe_step(rs.getInt("re_step"));
					dto.setRe_level(rs.getInt("re_level"));
					dto.setContent(rs.getString("content"));
					dto.setIp(rs.getString("ip"));
					
					list.add(dto);
				}while(rs.next());
			}//if
		}catch(Exception ex){System.out.println("getList() 예외발생:"+ex);
		}finally{
			try{
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
				if(con != null){con.close();}
				
			}catch(Exception ex2){}
		}//finally end
		return list;
	}//getList() end
		
	//----------------
    // 글내용보기
    //----------------
	public NoticeDto getArticle(int num) throws Exception{
		NoticeDto dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		
		try{
			con=getCon();
			sql="update notice set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt=con.prepareStatement("select * from notice where num=?");
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dto=new NoticeDto();
				
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setPasswd(rs.getString("passwd"));
				
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRef(rs.getInt("ref"));
				dto.setRe_step(rs.getInt("re_step"));
				dto.setRe_level(rs.getInt("Re_level"));
				dto.setContent(rs.getString("content"));
				dto.setIp(rs.getString("ip"));
			}
		}catch(Exception ex){
			System.out.println("getArticle() 예외 "+ex);
        }finally{
               try{
                     if(rs!=null){rs.close();}
                     if(pstmt!=null){pstmt.close();}
                     if(con!=null){con.close();}
               }catch(Exception ex2){}
        }//finally end
        return dto;
 }//getArticle() end--

	//-------------------
	//글 수정폼으로 보낼 내용
	//-------------------------
	public NoticeDto updateGetArticle(int num)throws Exception{
		NoticeDto dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con=getCon();
			pstmt=con.prepareStatement("select * from notice where num=?");
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dto=new NoticeDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRef(rs.getInt("ref"));
				dto.setRe_step(rs.getInt("re_step"));
				dto.setRe_level(rs.getInt("re_level"));
				
				dto.setContent(rs.getString("content"));
				dto.setIp(rs.getString("ip"));
			}
		}catch(Exception ex){
			System.out.println("updateGetArticle() 예외발생:"+ex);
		}finally{
			try{
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
				if(con != null){con.close();}
			}catch(Exception ex2){}
		}//finally end
		return dto;
	}//updateGetArticle() end
	
	//-------------------
	//db 글 수정
	//-------------------------
	public int updateArticle(NoticeDto dto)throws Exception{
		int x=-1;
		String dbPasswd="";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		try{
			con=getCon();
			pstmt=con.prepareStatement("select passwd from notice where num=?");
			pstmt.setInt(1, dto.getNum());
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dbPasswd=rs.getString("passwd");
				
				if(dbPasswd.equals(dto.getPasswd())){
					sql="update notice set writer=?, subject=?, content=? where num=?";
					
					pstmt=con.prepareStatement(sql);
					
					pstmt.setString(1, dto.getWriter());
					pstmt.setString(2, dto.getSubject());
					pstmt.setString(3, dto.getContent());
					pstmt.setInt(4, dto.getNum());
					
					pstmt.executeUpdate();
					
					x=1;
				}else{
					x=0;
				}//else end				
			}//if
		}catch(Exception ex){			
			System.out.println("updateArticle() 예외:"+ex);
		}finally{
			try{
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
				if(con != null){con.close();}
			}catch(Exception ex2){}
		}//finally end		
		return x;
	}//updateGetArticle() end
	
	//-------------------
		//db 글 삭제
		//-------------------------
		 public int deleteArticle(int num,String passwd)throws Exception{
			 Connection con=null;
			 PreparedStatement pstmt=null;
			 ResultSet rs=null;
			 String dbPasswd="";
			 int x=-1;
			 try{
				 con=getCon();
				 pstmt=con.prepareStatement("select passwd from notice where num=?");
				 pstmt.setInt(1,num);
				 rs=pstmt.executeQuery();
				 
				 if(rs.next()){
					 dbPasswd=rs.getString("passwd");
					 if(dbPasswd.equals(passwd)){//암호가 일치하면
						 pstmt=con.prepareStatement("delete from notice where num=?");
						 pstmt.setInt(1, num);
						 pstmt.executeUpdate();
						 x=1;//정상적으로 삭제
					 }else{//암호가 틀릴때
						 x=0;
					 }
				 }//if
			 }catch(Exception ex1){
				 System.out.println("deleteArticle() 예외:"+ex1);
			 }finally{
				 try{
						if(rs != null){rs.close();}
						if(pstmt != null){pstmt.close();}
						if(con != null){con.close();}
					}catch(Exception ex2){}
			 }//finally end			 
			 return x;
		 }//deleteArticle() end
	
}//class end
