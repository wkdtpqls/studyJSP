<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.io.*"%>
<% 
	//파일이 업로드되는 폴더 지정
	String saveFolder = "C://Temp";
	String encType = "utf-8";	//인코딩타입
	int maxSize = 5*1024*1024; //최대 업로드 크기 5Mb
	
	try{
		//MultipartRequest multi = null;
		// 전송을 담당할 컴포넌트를 생성하고 파일을 전송
		//multi = new MultipartRequest(request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
		
	// }catch(IOException ioe){
	//	System.out.println(ioe);
	}catch(Exception ex){
		System.out.println(ex);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>