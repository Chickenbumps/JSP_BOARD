package reply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReplyDAO {
    private Connection conn;
    private ResultSet rs;

    public ReplyDAO() {
        try{
            String dbURL = "jdbc:oracle:thin:@localhost:1521:webdb";
            String dbID="c##bo";
            String dbPassword = "1234";
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Reply> getList(int bbsID, int pageNumber){
        String SQL = "SELECT * FROM REPLY WHERE replyID < ? AND bbsID = ? AND replyAvailable = 1 AND rownum <= 10 ORDER BY replyID DESC";
        ArrayList<Reply> list = new ArrayList<>();
        try{
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,getNext() + (pageNumber-1)*10);
            pstmt.setInt(2,bbsID);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Reply reply = new Reply();
                reply.setBbsID(bbsID);
                reply.setReplyID(rs.getInt("replyID"));
                reply.setReplyContent(rs.getString("replyContent"));
                reply.setUserID(rs.getString("userID"));
                reply.setReplyAvailable(rs.getInt("replyAvailable"));
                list.add(reply);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public int getNext() {
        String SQL = "SELECT replyID FROM REPLY ORDER BY replyID DESC";
        try{
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if(rs.next()){
                return rs.getInt("replyID")+1;
            }
            return 1;
        }catch(Exception e){
            e.printStackTrace();
        }
        return -1;
    }

    public int write(int bbsID, String replyContent, String userID){
        String SQL = "INSERT INTO REPLY(USERID, REPLYID, REPLYCONTENT, BBSID, REPLYAVAILABlE) VALUES(?,?,?,?,?)";
        try{
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1,userID);
            pstmt.setInt(2,getNext());
            pstmt.setString(3,replyContent);
            pstmt.setInt(4,bbsID);
            pstmt.setInt(5,1);
            return pstmt.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }
        return -1;
    }

    public Boolean delete(int replyID){
        String SQL = "DELETE FROM REPLY WHERE replyID = ?";
        try{
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,replyID);
            pstmt.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
