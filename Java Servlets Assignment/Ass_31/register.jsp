<%@include file="database.jsp"%>
<%@include file="config.jsp"%>
<%
    if(request.getMethod().trim().equals("POST")){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String result;
        if (name.length()<=0 && email.length()<=0 && phone.length()<=0 && password.length()<=0){
            out.println("necessary field missing");
        }
        String insert = "INSERT INTO `registered_users`(`name`, `email`, `phone`, `password`) VALUES"
                        +"('"+name+"', '"+email+"', '"+phone+"', '"+password+"');";
        try{
            if(Database.insert(conn, insert)>0){
                result = "<script>"
                        +"alert(\'Successfully Registered!\'); "
                        +"self.location = 'http://'+location.host+'/31/'"
                    +"</script>";
                out.println(result);
                session.setAttribute("name", name);
                session.setAttribute("email", email);
            }else{
                result = "<script>"
                        +"alert(\'Some Error Occured!\'); "
                        +"self.location = 'http://'+location.host+'/31'"
                    +"</script>";
                out.println(result);
            }
        }catch(com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e){
            result = "<script>"
                        +"alert(\'Already Registered!\'); "
                        +"self.location = 'http://'+location.host+'/31'"
                    +"</script>";
            out.println(result);
        }

    }
%>
<%
Database.closeConnection(conn);
%>