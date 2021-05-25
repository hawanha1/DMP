import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

public class DeliveryBoy extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        response.setContentType("application/json");
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String action = request.getParameter("action");
        if(action.equals("addDeliveryBoy")){
            response.getWriter().println(addDeliveryBoy(request));
        }
        else if(action.equals("display")){
            try {
                response.getWriter().println(display());
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        else if(action.equals("delete")){
            try {
                response.getWriter().println(deleteDeliveryBoy(request));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

    }


    public  String deleteDeliveryBoy(HttpServletRequest request) throws SQLException{
        Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/dmp","root","");
        int id = Integer.parseInt(request.getParameter("id"));
        String query = "Delete from deliveryBoy Where id = \""+id+"\"";
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
        String query="select * from deliveryBoy";
        PreparedStatement statement = connection.prepareStatement(query);
        ResultSet resultSet = statement.executeQuery();
        String output = "{\"status\":true,\"result\":[";
        while (resultSet.next()){
            if(resultSet.isLast()){
                output+="{\"id\":\""+resultSet.getString("id")+"\",\"name\":\""+resultSet.getString("name")+"\",\"email\":\""+resultSet.getString("email")+"\",\"password\":\""+resultSet.getString("password")+"\"}";
            }else {
                output += "{\"id\":\"" + resultSet.getString("id") + "\",\"name\":\"" + resultSet.getString("name") + "\",\"email\":\"" + resultSet.getString("email") + "\",\"password\":\"" + resultSet.getString("password") + "\"},";
            }
        }
        output+="]}";
        return output;
    }

    public String addDeliveryBoy(HttpServletRequest request) throws IOException{
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        try {
            Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/dmp","root","");
            String query = "select * from deliveryBoy where email = \""+email+"\"";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                return "{\"status\":false,\"result\":\"email already exist\"}";
            }else{
                String query1 = "insert into deliveryBoy(email,name,password) values (\""+email+"\",\""+name+"\",\""+password+"\")";
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
