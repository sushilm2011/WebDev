<%
    Properties p = new Properties();
    String database = {YOUR DATABASE NAME};
    p.put("user",{USERNAME});
    p.put("password",{PASSWORD});
    Connection conn = Database.getConnection(database, p);
%>
