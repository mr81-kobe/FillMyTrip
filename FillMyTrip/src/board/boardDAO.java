package board;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import tt.Location;
import tt.course;

public class boardDAO {
   private Connection conn; // connection:db 뿉 젒洹쇳븯寃   빐二쇰뒗 媛앹껜

   //private PreparedStatement pstmt;

   private ResultSet rs;



   // mysql 泥섎━遺 遺 

   public boardDAO() {

      //  깮 꽦 옄瑜  留뚮뱾 뼱以  떎.

      try {

         String dbURL = "jdbc:mysql://localhost/hgj0307?characterEncoding=UTF-8&serverTimezone=UTC";

         
         
         String dbID = "hgj0307";

         String dbPassword = "bryantmr81";

         Class.forName("com.mysql.cj.jdbc.Driver");

         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

      } catch (Exception e) {

         e.printStackTrace();

      }

   }

   

   // 쁽 옱 쓽  떆媛꾩쓣 媛  졇 삤 뒗  븿 닔

   public String getDate() throws SQLException { 

      String SQL = "SELECT NOW()";

      try {

         PreparedStatement pstmt = conn.prepareStatement(SQL);

         rs = pstmt.executeQuery();

         if(rs.next()) {

            return rs.getString(1);

         }

      } catch (Exception e) {

         e.printStackTrace();
         conn.close();
         rs.close();
      }

      return ""; 
      
   }

   

   //bbsID 

      public int getNext() { 

         String SQL = "SELECT BOARD_NO FROM USERBOARD ORDER BY BOARD_NO DESC";

         try {

            PreparedStatement pstmt = conn.prepareStatement(SQL);

            rs = pstmt.executeQuery();

            if(rs.next()) {

               return rs.getInt(1) + 1;

            }

            return 1;//

         } catch (Exception e) {

            e.printStackTrace();

         }

         return -1; //
      }

      

      //

      public int write(String BOARD_TITLE, String USER_ID, String BOARD_CONTENT,int STARPOINT) throws SQLException { 

         String SQL = "INSERT INTO userboard VALUES(?, ?, ?, ?, ?, ?,?)";

         try {

            

            PreparedStatement pstmt = conn.prepareStatement(SQL);

            pstmt.setInt(1, getNext());

            pstmt.setString(2, BOARD_TITLE);

            pstmt.setString(3, USER_ID);

            pstmt.setString(4, getDate());

            pstmt.setString(5, BOARD_CONTENT);

            pstmt.setInt(6,1);
            
            pstmt.setInt(7,STARPOINT);

            

            return pstmt.executeUpdate();

            

         } catch (Exception e) {

            e.printStackTrace();
            conn.close();
         }

         return -1; // 뜲 씠 꽣踰좎씠 뒪  삤瑜 

      }



      public ArrayList<board> getList(int pageNumber){ 

         String SQL = "SELECT * FROM USERBOARD WHERE board_no < ? and board_available = 1 ORDER BY board_no DESC LIMIT 10";

         ArrayList<board> list = new ArrayList<board>();

         try {

            PreparedStatement pstmt = conn.prepareStatement(SQL);

            int a =getNext() - (pageNumber -1) * 10;
            pstmt.setInt(1,a);

            rs = pstmt.executeQuery();

            while (rs.next()) {

               board board = new board();

               board.setBOARD_NO(rs.getInt(1));

               board.setBOARD_TITLE(rs.getString(2));

               board.setUSER_ID(rs.getString(3));

               board.setBOARD_DATE(rs.getString(4));

               board.setBOARD_CONTENT(rs.getString(5));

               board.setBOARD_AVAILABLE(rs.getInt(6));
               
               board.setSTARPOINT(rs.getInt(7));

               list.add(board);

            }

         } catch (Exception e) {

            e.printStackTrace();

         }

         return list; 

      }
      public boolean nextPage (int pageNumber) {

         String SQL = "SELECT * FROM USERBOARD WHERE board_no < ? and board_Available = 1 ORDER BY board_no DESC LIMIT 10";

         ArrayList<board> list = new ArrayList<board>();

         try {

            PreparedStatement pstmt = conn.prepareStatement(SQL);

            pstmt.setInt(1, (getNext() - (pageNumber -1) * 10));

            rs = pstmt.executeQuery();

            if (rs.next()) {

               return true;

            }

         } catch (Exception e) {

            e.printStackTrace();

         }

         return false;       

      }
      public board getboard(int BOARD_NO) {

         String SQL = "SELECT * FROM USERBOARD WHERE BOARD_NO = ?";

         try {

            PreparedStatement pstmt = conn.prepareStatement(SQL);

            pstmt.setInt(1, BOARD_NO);

            rs = pstmt.executeQuery();

            if (rs.next()) {

               board board = new board();

               board.setBOARD_NO(rs.getInt(1));

               board.setBOARD_TITLE(rs.getString(2));

               board.setUSER_ID(rs.getString(3));

               board.setBOARD_DATE(rs.getString(4));

               board.setBOARD_CONTENT(rs.getString(5));

               board.setBOARD_AVAILABLE(rs.getInt(6));
               
               board.setSTARPOINT(rs.getInt(7));



               return board;

            }

         } catch (Exception e) {

            e.printStackTrace();

         }

         return null;



      }
      public int update(int BOARD_NO, String BOARD_TITLE, String BOARD_CONTENT, int STARPOINT) {

         String SQL = "UPDATE USERBOARD SET BOARD_TITLE = ?, BOARD_CONTENT = ?, STARPOINT = ? WHERE BOARD_NO = ?";

         try {

            PreparedStatement pstmt = conn.prepareStatement(SQL);

            pstmt.setString(1, BOARD_TITLE);

            pstmt.setString(2, BOARD_CONTENT);

            pstmt.setInt(3, STARPOINT);
            
            pstmt.setInt(4, BOARD_NO);
            
            

            return pstmt.executeUpdate();



         } catch (Exception e) {

            e.printStackTrace();

         }

         return -1; //  뜲 씠 꽣踰좎씠 뒪  삤瑜 

      }
      public int delete(int BOARD_NO) {

         String SQL = "UPDATE userboard SET BOARD_Available = 0 WHERE BOARD_NO = ?";

         try {

            PreparedStatement pstmt = conn.prepareStatement(SQL);   

            pstmt.setInt(1, BOARD_NO);

            return pstmt.executeUpdate();



         } catch (Exception e) {

            e.printStackTrace();

         }

         return -1; //  뜲 씠 꽣踰좎씠 뒪  삤瑜 

      }
      public ArrayList<board> getMyList(int pageNumber, String user_id){ 

         String SQL = "SELECT * FROM USERBOARD WHERE user_id ='"+user_id+"'  and board_no < ? and board_available = 1 ORDER BY board_no DESC LIMIT 10";

         ArrayList<board> list = new ArrayList<board>();

         try {

            PreparedStatement pstmt = conn.prepareStatement(SQL);

            int a =getNext() - (pageNumber -1) * 10;
            pstmt.setInt(1,a);

            rs = pstmt.executeQuery();

            while (rs.next()) {

               board board = new board();
               

               board.setBOARD_NO(rs.getInt(1));

               board.setBOARD_TITLE(rs.getString(2));

               board.setUSER_ID(rs.getString(3));

               board.setBOARD_DATE(rs.getString(4));

               board.setBOARD_CONTENT(rs.getString(5));

               board.setBOARD_AVAILABLE(rs.getInt(6));
               
               board.setSTARPOINT(rs.getInt(7));

               list.add(board);

            }

         } catch (Exception e) {

            e.printStackTrace();

         }

         return list; 

      }

      /*
       * public ArrayList<Location> set_marker(int areacode,String catcode){ String
       * SQL ="select title, lat, lot, tel, img, addr from tour_db where areacode = '"
       * +areacode+"' and (cat1 ='"+catcode+"' or cat2 ='"+catcode+"' or cat3 ='"
       * +catcode+"')"; ArrayList<Location> cl_li = new ArrayList<Location>(); try {
       * PreparedStatement pstmt = conn.prepareStatement(SQL);
       * 
       * 
       * rs = pstmt.executeQuery(); while (rs.next()) {
       * 
       * 
       * cl_li.add(new Location( Double.valueOf( rs.getString(2)),Double.valueOf(
       * rs.getString(3)),rs.getString(1),rs.getString(5),rs.getString(4),rs.getString
       * (6))); } } catch(Exception e){ e.printStackTrace(); } return cl_li; }
       */
       
      
      public int set_cor(course cor) {
           String SQL="INSERT INTO COURSE VALUES(?, ?, ?, ?,?)";    //입력받은 user 정보를 db에 저장함
           try {
              PreparedStatement  pstmt= conn.prepareStatement(SQL);
               pstmt.setString(1, cor.getId());
               
               pstmt.setString(2, cor.getName());
               pstmt.setString(3, cor.getMapx()); 
               pstmt.setString(4, cor.getMapy()); 
                
               pstmt.setString(7, cor.getTitle());
              
               return pstmt.executeUpdate();
           }catch(Exception e) {
               e.printStackTrace();
           }
           return -1;        //데이터베이스 오류
       }


      public ArrayList<Location> getlocation(String areacode, String cat2){ 

            String SQL = "select title,lot,lat,addr,tel,img from tour_db where areacode=? and cat2 =?";

            ArrayList<Location> list = new ArrayList<Location>();

            try {

               PreparedStatement pstmt = conn.prepareStatement(SQL);

               pstmt.setString(1, areacode); 

               pstmt.setString(2, cat2); 
               
               

               rs = pstmt.executeQuery();

               while (rs.next()) {

                  Location location = new Location();
                  

                  location.setTitle(rs.getString(1));
                  
                  location.setLot(rs.getString(2));

                  location.setLat(rs.getString(3));

                  location.setAddr(rs.getString(4));
                  
                  location.setTel(rs.getString(5));
                  
                  location.setImg(rs.getString(6));

                  

                  list.add(location);

               }

            } catch (Exception e) {

               e.printStackTrace();

            }

            return list; 

         }



      
        public ArrayList<Location> set_check(int areacode){ 
      String cat1 ="A05";
        String SQL ="select title,lot,lat,addr,tel,img  from tour_db where areacode='" +areacode+"' and cat1 = '"+cat1+"'  ";
        
        ArrayList<Location> list = new ArrayList<Location>(); 
        try {
        PreparedStatement pstmt = conn.prepareStatement(SQL);
        rs = pstmt.executeQuery(); 
        while (rs.next()) {
        
           Location location = new Location();
           location.setTitle(rs.getString(1));
               
               location.setLot(rs.getString(2));

               location.setLat(rs.getString(3));

               location.setAddr(rs.getString(4));
               
               location.setTel(rs.getString(5));
               
               location.setImg(rs.getString(6));
               
               

               list.add(location);
        }  
        }
       
       catch(Exception e){ e.printStackTrace();
       } 
        return list; 
        
       }
        
        
        public ArrayList<Location> set_check2(int areacode){ 
           String cat1 ="B02"; 
           String SQL ="select title,lot,lat,addr,tel,img  from tour_db where areacode = '" +areacode+"' and cat1 = '"+cat1+"' ";
        
       ArrayList<Location> list = new ArrayList<Location>();
       
        
       
        try { PreparedStatement pstmt = conn.prepareStatement(SQL);
        
       
        rs = pstmt.executeQuery(); while (rs.next()) {
        
       
           Location location = new Location();
           
           location.setTitle(rs.getString(1));
               
               location.setLot(rs.getString(2));

               location.setLat(rs.getString(3));

               location.setAddr(rs.getString(4));
               
               location.setTel(rs.getString(5));
               
               location.setImg(rs.getString(6));
              
               

               list.add(location);
       
        } 
        
        
        } 
        
        
        
        catch(Exception e){ e.printStackTrace(); }
        
        
        return list; }
       
      
         public int set_mytrip(String user_id,String title,String index,String name,String arrivetime,String distance,String totaldistance,String totaltime,String lot,String lat,int viatime, int available) {
              String SQL="INSERT INTO mytrip_db VALUES(?,?, ?, ?, ?,?,?,?,?,?,?,?,?)";    //입력받은 user 정보를 db에 저장함
              try {
                 PreparedStatement  pstmt= conn.prepareStatement(SQL);
                 pstmt.setInt(1, getNexttrip());
                  pstmt.setString(2, user_id);
                  
                  pstmt.setString(3, title);
                  pstmt.setString(4, index); 
                  pstmt.setString(5, name); 
                  pstmt.setString(6, arrivetime); 
                  pstmt.setString(7, distance); 
                  pstmt.setString(8, totaldistance);
                  pstmt.setString(9, totaltime);
                  pstmt.setString(10, lot);
                  pstmt.setString(11, lat);
                  pstmt.setInt(12, viatime);
                  pstmt.setInt(13, available);
                 
                  return pstmt.executeUpdate();
              }catch(Exception e) {
                  e.printStackTrace();
              }
              return -1;        //데이터베이스 오류
          }
         
         public int getNexttrip() { 

            String SQL = "SELECT no FROM mytrip_db ORDER BY no DESC";

            try {

               PreparedStatement pstmt = conn.prepareStatement(SQL);

               rs = pstmt.executeQuery();

               if(rs.next()) {

                  return rs.getInt(1) + 1;

               }

               return 1;//泥  踰덉㎏ 寃뚯떆臾쇱씤 寃쎌슦

            } catch (Exception e) {

               e.printStackTrace();

            }

            return -1; // 뜲 씠 꽣踰좎씠 뒪  삤瑜 

         }
         public int getMyTripNo() {
            
            String SQL ="select count(DISTINCT title) from mytrip_db";
            try {

               PreparedStatement pstmt = conn.prepareStatement(SQL);

               rs = pstmt.executeQuery();

               if(rs.next()) {

                  return rs.getInt(1);

               }

               

            } catch (Exception e) {

               e.printStackTrace();

            }

            return -1;
         }
         
         
         
        public ArrayList<mytrip> getMyTrip(String user_id,int start,int end){ 

         String SQL = "SELECT title,totaldistance,totaltime,available FROM mytrip_db WHERE user_id =? group by  title ORDER BY no  LIMIT ?,?";

         ArrayList<mytrip> list = new ArrayList<mytrip>();

         try {

            PreparedStatement pstmt = conn.prepareStatement(SQL);
            
            pstmt.setString(1, user_id);
            
            pstmt.setInt(2, start);
            
            pstmt.setInt(3, end);


            rs = pstmt.executeQuery();

            while (rs.next()) {

               mytrip mytrip = new mytrip();
               

               mytrip.setTitle(rs.getString(1));

               mytrip.setTotaldistance(rs.getString(2));

               mytrip.setTotaltime(rs.getString(3));
               
               mytrip.setAvailable(rs.getInt(4));

               

               list.add(mytrip);

            }

         } catch (Exception e) {

            e.printStackTrace();

         }

         return list; 

      }
         
        public ArrayList<mytrip> goMyTrip(String title){ 

         String SQL = "SELECT title, trip_index ,name, arrivetime, distance ,totaldistance ,totaltime,lot,lat,viatime,user_id FROM mytrip_db WHERE title ='"+title+"'";

         ArrayList<mytrip> list = new ArrayList<mytrip>();

         try {

            PreparedStatement pstmt = conn.prepareStatement(SQL);

         /*
          * int a =getNext() - (pageNumber -1) * 10; pstmt.setInt(1,a);
          */

            rs = pstmt.executeQuery();

            while (rs.next()) {

               mytrip mytrip = new mytrip();
               

               mytrip.setTitle(rs.getString(1));

               mytrip.setIndex(rs.getString(2));

               mytrip.setName(rs.getString(3));
               
               mytrip.setArrivetime(rs.getString(4));
               
               mytrip.setDistance(rs.getString(5));
               
               mytrip.setTotaldistance(rs.getString(6));
               
               mytrip.setTotaltime(rs.getString(7));
               
               mytrip.setLot(rs.getString(8));
               
               mytrip.setLat(rs.getString(9));
               
               mytrip.setViatime(rs.getInt(10));
               
               mytrip.setUser_id(rs.getString(11));


               list.add(mytrip);

            }

         } catch (Exception e) {

            e.printStackTrace();

         }

         return list; 

      }
         
         public int deletereview(String title) {
            
            String SQL ="delete from review where title='"+title+"'";
            try {

               PreparedStatement pstmt = conn.prepareStatement(SQL);   

               

               return pstmt.executeUpdate();

               

            } catch (Exception e) {

               e.printStackTrace();

            }

            return -1;
         }
   public int deletecomment(String title) {
      
      String SQL ="delete from mytrip_comment where title='"+title+"'";
      try {

         PreparedStatement pstmt = conn.prepareStatement(SQL);   

         

         return pstmt.executeUpdate();

         

      } catch (Exception e) {

         e.printStackTrace();

      }

      return -1;
   }
         public int deleteMyTrip(String title) {
            
            deletecomment(title);
            deletereview(title); 
            
            String SQL ="delete from mytrip_db where title='"+title+"'";
            try {

               PreparedStatement pstmt = conn.prepareStatement(SQL);   

               

               return pstmt.executeUpdate();

               

            } catch (Exception e) {

               e.printStackTrace();

            }

            return -1;
         }
   public int checkmytitle(String title) {
            
      String SQL = "select * from mytrip_db where title='"+title +"'";

            try {

               PreparedStatement pstmt = conn.prepareStatement(SQL);   

               rs = pstmt.executeQuery();
               
                if(rs.next() ==true){
                       return -1;
                       
                    }else if(title== null){
                       return 1;
                       
                    }else{
                       return 0;


                    }

               

            } catch (Exception e) {

               e.printStackTrace();

            }

            return 0;
         }
         
   public int checkemail(String email) {
      
      String SQL = "select * from member where email='"+email +"'";

            try {

               PreparedStatement pstmt = conn.prepareStatement(SQL);   

               rs = pstmt.executeQuery();

                if(rs.next() == true){
                       return -1;
                       
                    }else if(email== null){
                       return 1;
                       
                    }else{
                       return 0;


                    }

               

            } catch (Exception e) {

               e.printStackTrace();

            }

            return 0;
         }   
         
   public int logincheck(String id, String pw) { 

      String SQL = "SELECT pw FROM member WHERE email= ?";

      try{
         PreparedStatement pstmt = conn.prepareStatement(SQL);   


         pstmt.setString(1, id);
         

         rs = pstmt.executeQuery();
         

         if (rs.next() == true) {

            if(rs.getString(1).equals(pw)) {
               return 1; // 라긴 성공
            }

               return 0;
            

         }


         return -1; // 아이디가 없음 오류


      }catch (Exception e){

         e.printStackTrace();

      }

      return -2; 

   }

   public int joincheck(String id, String email, String pw,String name ,String year,String month,String day,String ph) { 

      String SQL = "INSERT INTO member VALUES(?,?,?,?,?,?,?,?)";

      try{

         

         PreparedStatement pstmt = conn.prepareStatement(SQL);

         pstmt.setString(1, id);

         pstmt.setString(2, email);

         pstmt.setString(3, pw);

         pstmt.setString(4, name);

         pstmt.setString(5, year);

         pstmt.setString(6, month);
         
         pstmt.setString(7, day);
         
         pstmt.setString(8, ph);

         
         return pstmt.executeUpdate();

         

      }catch (Exception e){

         e.printStackTrace();

      }

      return -1; // 뜲 씠 꽣踰좎씠 뒪  삤瑜 

   }

   public int comment_post(String id, String comment, String regdate,int board_no ) { 

      String SQL = "INSERT INTO board_comment(user_id,comment,regdate,board_no) VALUES(?,?,?,?)";

      try{

         

         PreparedStatement pstmt = conn.prepareStatement(SQL);

         pstmt.setString(1, id);

         pstmt.setString(2, comment);

         pstmt.setString(3, regdate);

         pstmt.setInt(4, board_no);

         
         return pstmt.executeUpdate();

         

      }catch (Exception e){

         e.printStackTrace();

      }

      return -1; // 뜲 씠 꽣踰좎씠 뒪  삤瑜 

   }

   

   public int tripcomment_post(String id, String comment, String regdate,String title ) { 

      String SQL = "INSERT INTO mytrip_comment(user_id,comment,regdate,title) VALUES(?,?,?,?)";

      try{

         

         PreparedStatement pstmt = conn.prepareStatement(SQL);

         pstmt.setString(1, id);

         pstmt.setString(2, comment);

         pstmt.setString(3, regdate);

         pstmt.setString(4, title);

         
         return pstmt.executeUpdate();

         

      }catch (Exception e){

         e.printStackTrace();

      }

      return -1; // 뜲 씠 꽣踰좎씠 뒪  삤瑜 

   }

   public ArrayList<trip_comment> gettripComment(String title){ 

      String SQL = "SELECT user_id,comment,regdate FROM mytrip_comment WHERE title ='"+title+"'";

      ArrayList<trip_comment> list = new ArrayList<trip_comment>();

      try {

         PreparedStatement pstmt = conn.prepareStatement(SQL);

      /*
       * int a =getNext() - (pageNumber -1) * 10; pstmt.setInt(1,a);
       */

         rs = pstmt.executeQuery();

         while (rs.next()) {

            trip_comment comment =new trip_comment();
            
            comment.setUser_id(rs.getString(1));
            
            comment.setComment(rs.getString(2));
            
            comment.setRegdate(rs.getString(3));
            

            list.add(comment);

         }

      } catch (Exception e) {

         e.printStackTrace();

      }

      return list; 

   }

   public int reviewWrite(String title, String user_id, String review_content,int starpoint) { 

      String SQL = "INSERT INTO review VALUES(?, ?, ?, ?)";

      try {

         

         PreparedStatement pstmt = conn.prepareStatement(SQL);

         

         pstmt.setString(1, title);

         pstmt.setString(2, user_id);

         pstmt.setString(3, review_content);

         pstmt.setInt(4,starpoint);


         return pstmt.executeUpdate();

         

      } catch (Exception e) {

         e.printStackTrace();

      }

      return -1; // 뜲 씠 꽣踰좎씠 뒪  삤瑜 

   }

   public int reviewCheck(String title) { 

      String SQL = "SELECT * FROM review WHERE title= ?";

      try{
         PreparedStatement pstmt = conn.prepareStatement(SQL);   


         pstmt.setString(1, title);
         

         rs = pstmt.executeQuery();
         

         if (rs.next() == true) {

               return 1;
            

         }


         return -1; // 아이디가 없음 오류


      }catch (Exception e){

         e.printStackTrace();

      }

      return -2; 

   }
   public review getreview(String title) {

      String SQL = "SELECT * FROM review WHERE title = ?";

      try {

         PreparedStatement pstmt = conn.prepareStatement(SQL);

         pstmt.setString(1, title);

         rs = pstmt.executeQuery();

         if (rs.next()) {

            
            review review = new review();

            review.setTitle(rs.getString(1));

            review.setUser_id(rs.getString(2));

            review.setReview_content(rs.getString(3));

            review.setStarpoint(rs.getInt(4));

            



            return review;

         }

      } catch (Exception e) {

         e.printStackTrace();

      }

      return null;



   }

   public int reviewupdate( String title, String review_content, int starpoint) {

      String SQL = "UPDATE review SET review_content = ?, starpoint = ? WHERE title = ?";

      try {

         PreparedStatement pstmt = conn.prepareStatement(SQL);

         pstmt.setString(1, review_content);
         
           pstmt.setInt(2, starpoint);
           
         pstmt.setString(3, title);

         return pstmt.executeUpdate();



      } catch (Exception e) {

         e.printStackTrace();

      }

      return -1; //  뜲 씠 꽣踰좎씠 뒪  삤瑜 

   }

   public ArrayList<mytrip> getTrip(int start,int end){ 

      String SQL = "SELECT title,user_id ,totaldistance,totaltime FROM mytrip_db where available = 1  group by  title ORDER BY no  LIMIT ?,?";

      ArrayList<mytrip> list = new ArrayList<mytrip>();

      try {

         PreparedStatement pstmt = conn.prepareStatement(SQL);

      /*
       * int a =getNext() - (pageNumber -1) * 10; pstmt.setInt(1,a);
       * 
       * 
       */
          
         pstmt.setInt(1, start);
         pstmt.setInt(2, end);

         rs = pstmt.executeQuery();

         while (rs.next()) {

            mytrip mytrip = new mytrip();
            

            mytrip.setTitle(rs.getString(1));
            
            mytrip.setUser_id(rs.getString(2));

            mytrip.setTotaldistance(rs.getString(3));

            mytrip.setTotaltime(rs.getString(4));

            

            list.add(mytrip);

         }

      } catch (Exception e) {

         e.printStackTrace();

      }

      return list; 

   }

   public int availableupdate( String title,int available) {

      String SQL = "UPDATE mytrip_db SET available = ? where title = ?";

      try {

         PreparedStatement pstmt = conn.prepareStatement(SQL);

         pstmt.setInt(1, available);
         
         pstmt.setString(2, title);

         return pstmt.executeUpdate();



      } catch (Exception e) {

         e.printStackTrace();

      }

      return -1; //  뜲 씠 꽣踰좎씠 뒪  삤瑜 

   }

   public int getCommentNo(String title) {
      
      String SQL ="select count(comment) from mytrip_comment where title =?";
      try {

         PreparedStatement pstmt = conn.prepareStatement(SQL);
         
         pstmt.setString(1, title);

         rs = pstmt.executeQuery();

         if(rs.next()) {

            return rs.getInt(1);

         }

         

      } catch (Exception e) {

         e.printStackTrace();

      }

      return -1;
   }
   public int finduser(String id,String email,String name) {
      
      String SQL = "select * from member where id = ? and email = ? and name = ?";

            try {

               PreparedStatement pstmt = conn.prepareStatement(SQL);   
               
               pstmt.setString(1, id);
               
               pstmt.setString(2, email);
               
               pstmt.setString(3, name);

               rs = pstmt.executeQuery();

                if(rs.next() == true){
                       return 1;
                       
                    }else{
                       return 0;


                    }

               

            } catch (Exception e) {

               e.printStackTrace();

            }

            return 0;
         }   

   public int setpw( String pw, String email) {

      String SQL = "UPDATE member SET  pw= ? where email = ?";

      try {

         PreparedStatement pstmt = conn.prepareStatement(SQL);

         pstmt.setString(1, pw);
         
         pstmt.setString(2, email);
         

         return pstmt.executeUpdate();



      } catch (Exception e) {

         e.printStackTrace();

      }

      return -1; //  뜲 씠 꽣踰좎씠 뒪  삤瑜 

   }

   

   public int getlocationNo(String areacode,String cat2) {
      
      String SQL ="select count(title) from tour_db where areacode= ? and cat2 =?";
      try {

         PreparedStatement pstmt = conn.prepareStatement(SQL);
         
         pstmt.setString(1, areacode);
         pstmt.setString(2, cat2);

         rs = pstmt.executeQuery();

         if(rs.next()) {

            return rs.getInt(1);

         }

         

      } catch (Exception e) {

         e.printStackTrace();

      }

      return -1;
   }
}










