

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


public class User extends HttpServlet
{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        try {
             Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String action = request.getParameter("action");
        if(action.equals("addUser")) {
            response.getWriter().println(addUser(request));
        }
    }
    public String addUser(HttpServletRequest request) throws IOException{
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        try {
            Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/dmp","root","");
            String query = "select * from user where email = \""+email+"\"";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                return "{\"status\":false,\"result\":\"email already exist\"}";
            }else{
                String query1 = "insert into user(phone,email,name,password) values (\""+tel+"\",\""+email+"\",\""+name+"\",\""+password+"\")";
                PreparedStatement statement1 = connection.prepareStatement(query1);
                statement1.executeUpdate();
                return "{"+"\"status\":true}";
            }
        }catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "{"+"\"status\":false}";
    }
}
