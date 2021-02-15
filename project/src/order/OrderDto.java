package order;
import java.util.*;
//주문 모델빈
public class OrderDto {
	private int ordno;//주문번호
	private int pro_no;//상품일련번호
	private String quantity;//주문 수량
	private Date orddate;//주문날짜 
	private String state;//상태
	private String m_id;//유저 아이디 

	public OrderDto(){}//디폴트 생성자 

	public int getOrdno() {
		return ordno;
	}

	public void setOrdno(int ordno) {
		this.ordno = ordno;
	}

	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public Date getOrddate() {
		return orddate;
	}

	public void setOrddate(Date orddate) {
		this.orddate = orddate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	
}//class
