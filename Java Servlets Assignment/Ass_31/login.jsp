<%@include file="database.jsp"%>
<%@include file="config.jsp"%>
<%
    if(request.getMethod().trim().equals("POST")){
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String result;
        if (email.length()<=0 && password.length()<=0){
            out.println("Necessary field missing");
        }
        String name = "";
        String query = "SELECT * FROM `registered_users` WHERE "
                        +"`email` = '"+email+"' and `password` = '"+password+"';";
        try{
            ResultSet rs = Database.query(conn, query);
            boolean found = false;
            while(rs.next()){
                found = true;
                name = rs.getString("name");
                session.setAttribute("name", name);
                session.setAttribute("email", email);
            }
            if(!found){
                result = "<script>"
                        +"alert(\'Please Register First!\'); "
                        +"self.location = 'http://'+location.host+'/31/'"
                    +"</script>";
                out.println(result);
            }else{
                out.println("Hi, " + name);
            }
        }catch(com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e){
            result = "<script>"
                        +"alert(\'Error Occurred\'); "
                        +"self.location = 'http://'+location.host+'/31'"
                    +"</script>";
            out.println(result);
        }

    }
%>
<%
Database.closeConnection(conn);
%>