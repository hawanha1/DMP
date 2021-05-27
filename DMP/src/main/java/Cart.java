import javax.print.attribute.standard.ReferenceUriSchemesSupported;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

public class Cart extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        response.setContentType("application/json");
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String action = request.getParameter("action");
        if(action.equals("addToCart")){
            try {
                response.getWriter().println(addToCart(request));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }if(action.equals("displayCart")){
            try {
                response.getWriter().println(display());
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }if(action.equals("delete")){
            try {
                response.getWriter().println(delete(request));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public String delete(HttpServletRequest request) throws SQLException {
        Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/dmp","root","");
        int id = Integer.parseInt(request.getParameter("id"));
        String query = "Delete from cart Where cartId = \""+id+"\"";
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
        Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/dmp","root","");
        String query="select * from cart";
        PreparedStatement statement = connection.prepareStatement(query);
        ResultSet resultSet = statement.executeQuery();
        String output = "{\"status\":true,\"result\":[";
        while (resultSet.next()){
            if(resultSet.isLast()) {
                output += "{\"id\":\"" + resultSet.getString("cartId") + "\",\"name\":\""+resultSet.getString("productName")+"\",\"price\":\"" + resultSet.getString("productPrice") + "\",\"description\":\"" + resultSet.getString("productDescription") + "\"}";
            }else{
                output += "{\"id\":\""+resultSet.getString("cartId")+"\",\"name\":\"" + resultSet.getString("productName") + "\",\"price\":\"" + resultSet.getString("productPrice") + "\",\"description\":\"" + resultSet.getString("productDescription") + "\"},";
            }
        }
        output+="]}";
        return output;    }



    public  String addToCart(HttpServletRequest request) throws SQLException {
        Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/dmp","root","");
        String productId=request.getParameter("productId");
        String queryForProductInfo= "select * from product where id = \""+productId+"\"";
        PreparedStatement statement=connection.prepareStatement(queryForProductInfo);
        ResultSet resultSet=statement.executeQuery();
        resultSet.next();
        String productName=resultSet.getString("name");
        int productPrice = Integer.parseInt(resultSet.getString("price"));
        String productDescription=resultSet.getString("description");
        String insertQuery="insert into cart(productName,productPrice,ProductDescription) values (\""+productName+"\",\""+productPrice+"\",\""+productDescription+"\")";
        PreparedStatement statement1 = connection.prepareStatement(insertQuery);
        int result=statement1.executeUpdate();
        if(result>0){
            return "{\"status\":true}";
        }else{
            return "{\"status\":false,\"result\":data not entered}";
        }
    }
}
