<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="kr.or.bit.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//json 객체 변환
	//1. JSONObject 사용하면 json 객체  1개 만드는거 >> {} 생성
	//2. JSONArray  사용하면 json 객체 !배열!을 만드는거 >> []{},{},{}]
			
	Member member = new Member();
	//json 객체
	//String jsonmember = "{" + "username" : "+ member.get ... " 이렇게 안해요.......언제해요......
		
	JSONObject objmember = JSONObject.fromObject(member);
	//{"address":"서울시 강남구","admin":"1","password":"1004","username":"bit"}
%>

<%=objmember %>
<hr>
<%
	List<Member> memberlist = new ArrayList<>();
	memberlist.add(new Member("hong","1004","서울시 강남구","0"));
	memberlist.add(new Member("kim","1004","서울시 강남구","1"));
	memberlist.add(new Member("park","1004","서울시 강남구","0"));

	//JSON : []{},{},{}]
	JSONArray memberarray = JSONArray.fromObject(memberlist);
%>
<%=memberarray%>