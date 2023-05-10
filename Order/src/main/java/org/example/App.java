package org.example;
import java.sql.*;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
//        System.out.println( "Hello World!" );

        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root", "pass@word1");

            Statement statement = connection.createStatement();


//            ResultSet resultSet = statement.executeQuery("select * from hotel where hotel_loc='Kadapa'");
//            while(resultSet.next()) {
//                System.out.println(resultSet.getInt(1) + " "+ resultSet.getString(2) + " "+ resultSet.getString(3));
//            }

//            ResultSet resultSet = statement.executeQuery("select * from menu m join hotel h on m.hotel_id=h.hotel_id where h.hotel_id=5");
//            while(resultSet.next()) {
//                System.out.println(resultSet.getInt(1) + " "+ resultSet.getString(2) + " "+ resultSet.getString(3)
//                        + " "+ resultSet.getString(4)+ " "+ resultSet.getString(5));
//            }

            ResultSet resultSet = statement.executeQuery("select * from customer where cus_id=2");
            while(resultSet.next()) {
                System.out.println(resultSet.getInt(1) + " "+ resultSet.getString(5));
            }



            connection.close();

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
