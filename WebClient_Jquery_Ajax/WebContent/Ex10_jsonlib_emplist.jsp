<%@page import="net.sf.json.JSONArray"%>
<%@page import="kr.or.bit.dto.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	//CORS policy: No 'Access-Control-Allow-Origin'
	//서버가 나는 모든 요청을 허락할게 
	
	response.addHeader("Access-Control-Allow-Origin", "*");

	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = null; //Connection 인터페이스 ...
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bituser","1004");

	Statement  stmt = conn.createStatement(); //명령 객체 얻어오기
	String sql = "select empno , ename , sal , job ,comm  from emp";
	ResultSet rs = stmt.executeQuery(sql); //DB서버에서 실행되고 결과를 생성
	
	//POINT 
	//DTO 객체 데이터 담아야 변환
	//데이건 여러건 ArrayList add
	//DTO 객체를 생성해서 데이터를 담아야 변환 작업을 할수있음
	//데이터 여러건 ArrayList에 add 시키면 된당
	List<Emp> list = new ArrayList<>();
	
	while(rs.next()){
		Emp emp = new Emp();
		emp.setEmpno(rs.getInt("empno"));
		emp.setEname(rs.getString("ename"));
		emp.setSal(rs.getInt("sal"));
		emp.setJob(rs.getString("job"));
		emp.setComm(rs.getInt("comm"));
		
		list.add(emp);
	}
	
	//for(Emp e : list){
	//	System.out.println(e.toString());
	//}
	
	//[{},{},{} ,,,,,, 14객 객체]//[{},{},{},{}...이렇게 못해] 다른방법!
	JSONArray jsonlist = JSONArray.fromObject(list);	  //이게 우리가 원하는 서비스 하는 코드
													   //조건 : 객체로 넣어줘야해 !!!!!
	/*
	[{"comm":0,"empno":7369,"ename":"SMITH","job":"CLERK","sal":800},
	 {"comm":300,"empno":7499,"ename":"ALLEN","job":"SALESMAN","sal":1600},
	 {"comm":200,"empno":7521,"ename":"WARD","job":"SALESMAN","sal":1250},
	 {"comm":30,"empno":7566,"ename":"JONES","job":"MANAGER","sal":2975},
	 {"comm":300,"empno":7654,"ename":"MARTIN","job":"SALESMAN","sal":1250},
	 {"comm":0,"empno":7698,"ename":"BLAKE","job":"MANAGER","sal":2850},
	 {"comm":0,"empno":7782,"ename":"CLARK","job":"MANAGER","sal":2450},
	 {"comm":0,"empno":7788,"ename":"SCOTT","job":"ANALYST","sal":3000},
	 {"comm":3500,"empno":7839,"ename":"KING","job":"PRESIDENT","sal":5000},
	 {"comm":0,"empno":7844,"ename":"TURNER","job":"SALESMAN","sal":1500},
	 {"comm":0,"empno":7876,"ename":"ADAMS","job":"CLERK","sal":1100},
	 {"comm":0,"empno":7900,"ename":"JAMES","job":"CLERK","sal":950},
	 {"comm":0,"empno":7902,"ename":"FORD","job":"ANALYST","sal":3000},
	 {"comm":0,"empno":7934,"ename":"MILLER","job":"CLERK","sal":1300},
	 {"comm":0,"empno":9999,"ename":"홍길동","job":"","sal":0}]
	*/
	stmt.close();
	rs.close();
	conn.close();
%>
<%=jsonlist%>    
    
