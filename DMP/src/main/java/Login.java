import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
    public class Login extends HttpServlet
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
            if(action.equals("userLogin")) {
                response.getWriter().println(userLogin(request));
            }
            else if(action.equals("adminLogin")){
                response.getWriter().println(adminLogin(request));
            }
            else if(action.equals("deliveryBoyLogin")){
                response.getWriter().println(deliveryBoyLogin(request));
            }else if(action.equals("checkLogin")){
                try {
                    response.getWriter().println(checkLogin());
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }else if(action.equals("deleteLogin")){
                try {
                    response.getWriter().println(deleteLogin());
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }

        public String deleteLogin() throws SQLException {
            Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/dmp","root","");
            String query="delete from login";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.executeUpdate();
            return "{\"status\":true}";
        }

        public String checkLogin() throws SQLException {
            Connection connection= null;
            try {
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dmp","root","");
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            String query="select * from login";
            PreparedStatement statement=connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                return "{\"status\":true}";
            }
            else{
                return "{\"status\":false}";
            }
        }



        public String adminLogin(HttpServletRequest request) throws IOException{
            String email = request.getParameter("adminEmail");
            String password = request.getParameter("adminPassword");
            try {
                Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/dmp","root","");
                String query = "select * from admin where email = \""+email+"\"";
                PreparedStatement statement = connection.prepareStatement(query);
                ResultSet resultSet = statement.executeQuery();
                if(resultSet.next()){
                    if(password.equals(resultSet.getString("password"))){
                        String query1="insert into login(email,password) values (\""+email+"\",\""+password+"\")";
                        PreparedStatement statement1 = connection.prepareStatement(query1);
                        statement1.executeUpdate();
                        return "{\"status\":true}";
                    }
                    else{
                        return "{\"status\":false,\"result\":\"email or password miss match\"}";
                    }
                }else{
                    return "{\"status\":false,\"result\":\"email or password miss match\"}";
                }
            }catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return "{\"status\":false,\"result\":\"email or password miss match\"}";
        }


        public String deliveryBoyLogin(HttpServletRequest request) throws IOException{
            String email = request.getParameter("deliveryEmail");
            String password = request.getParameter("deliveryPassword");
            try {
                Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/dmp","root","");
                String query = "select * from deliveryBoy where email = \""+email+"\"";
                PreparedStatement statement = connection.prepareStatement(query);
                ResultSet resultSet = statement.executeQuery();
                if(resultSet.next()){
                    if(password.equals(resultSet.getString("password"))){
                        String query1="insert into login(email,password) values (\""+email+"\",\""+password+"\")";
                        PreparedStatement statement1 = connection.prepareStatement(query1);
                        statement1.executeUpdate();
                        return "{\"status\":true}";
                    }
                    else{
                        return "{\"status\":false,\"result\":\"email or password miss match\"}";
                    }
                }else{
                    return "{\"status\":false,\"result\":\"email or password miss match\"}";
                }
            }catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return "{\"status\":false,\"result\":\"email or password miss match\"}";
        }


        public String userLogin(HttpServletRequest request) throws IOException{
            String email = request.getParameter("userEmail");
            String password = request.getParameter("userPassword");
            try {
                Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/dmp","root","");
                String query = "select * from user where email = \""+email+"\"";
                PreparedStatement statement = connection.prepareStatement(query);
                ResultSet resultSet = statement.executeQuery();
                if(resultSet.next()){
                    if(password.equals(resultSet.getString("password"))){
                        String query1="insert into login(email,password) values (\""+email+"\",\""+password+"\")";
                        PreparedStatement statement1 = connection.prepareStatement(query1);
                        statement1.executeUpdate();
                        return "{\"status\":true}";
                    }
                    else{
                        return "{\"status\":false,\"result\":\"email or password miss match\"}";
                    }
                }else{
                    return "{\"status\":false,\"result\":\"email or password miss match\"}";
                }
            }catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return "{\"status\":false,\"result\":\"email or password miss match\"}";
        }
    }
