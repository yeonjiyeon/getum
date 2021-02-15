<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.*"%>
<%--confirmId.jsp--%>

<%
String id=request.getParameter("id");
member.LoginDao dao=member.LoginDao.getInstance();
int check=dao.confirmId(id);
%>
{
"check":<%= check%>
}