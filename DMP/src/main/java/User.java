

import javax.management.DescriptorRead;
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
        else if(action.equals("displayUsers")){
            try {
                response.getWriter().println(display());
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }else if(action.equals("deleteUser")){
            try {
                response.getWriter().println(deleteUser(request));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }




    public String deleteUser(HttpServletRequest request) throws SQLException{
        Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/dmp","root","");
        int id = Integer.parseInt(request.getParameter("id"));
        String query = "Delete from user Where id = \""+id+"\"";
        PreparedStatement statement = connection.prepareStatement(query);
        int result = statement.executeUpdate();
        if(result>0){
            return "{\"status\":true}";
        }
        else{
            return "{\"status\":false}";
        }
    }

    public String display() throws SQLException {
        Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/dmp","root","");
        String query="select * from user";
        PreparedStatement statement = connection.prepareStatement(query);
        ResultSet resultSet = statement.executeQuery();
        String output = "{\"status\":true,\"result\":[";
        while (resultSet.next()){
            if(resultSet.isLast()) {
                output += "{\"id\":\"" + resultSet.getString("id") + "\",\"name\":\"" + resultSet.getString("name") + "\",\"email\":\"" + resultSet.getString("email") + "\",\"phone\":\"" + resultSet.getString("phone") + "\"}";
            }else{
                output += "{\"id\":\"" + resultSet.getString("id") + "\",\"name\":\"" + resultSet.getString("name") + "\",\"email\":\"" + resultSet.getString("email") + "\",\"phone\":\"" + resultSet.getString("phone") + "\"},";
            }
        }
        output+="]}";
        return output;
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
                return "{\"status\":true}";
            }
        }catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "{\"status\":false,\"result\":\"email already exist\"}";
    }
}
