package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDAO(){
        try{
            String dbURL = "jdbc:oracle:thin:@localhost:1521:webdb";
            String dbID = "c##bo";
            String dbPassword = "1234";
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
        } catch(Exception e){
            System.err.println(e);
        }
    }

    public int login(String userID, String userPassword){
        String SQL = "SELECT userpassword FROM USER_INFO WHERE userID=?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1,userID);
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString(1).equals(userPassword)){
                    return 1;
                }else {
                    return 0;
                }
            }
            return -1;
        } catch(Exception e){

        }
        return -2;
    }

    public int join(User user) {
        String SQL = "INSERT INTO USER_INFO VALUES (?,?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1,user.getUserID());
            pstmt.setString(2,user.getUserPassword());
            pstmt.setString(3,user.getUserName());
            pstmt.setString(4,user.getUserGender());
            pstmt.setString(5,user.getUserEmail());
            return pstmt.executeUpdate();
        } catch(Exception e){
            System.out.println("JOIN ERROR");
        }
        return -2;
    }

}
