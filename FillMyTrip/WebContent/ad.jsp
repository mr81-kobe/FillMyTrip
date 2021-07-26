<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="org.omg.*"%>
<%@ page import="javax.xml.parsers.*"%>
<%@ page import="tt.*"%> 
<%@ page import="board.*"%>
<%@
 page import="java.util.*"%>
<%!




      
        ResultSet resultSet;
         int j=0;
        int i = 0;
        String city;
       
      String mm;
        String lat_str; 
        String lot_str;
        String areaCode;
        ArrayList<Location> hotel_li = new ArrayList<Location>();
        ArrayList<Location> food_li = new ArrayList<Location>();
        ArrayList<Location> cl_li = new ArrayList<Location>();
        String tag_[];
        String PLACE_NAME ="";
        String LATITUDE = "";
        String LONGITUDE= "";
        
        String  tag ;

        ArrayList<Number> timeList = new ArrayList<Number>();
        
        String sel = "";
        boardDAO board = new boardDAO();
        boardDAO board1 = new boardDAO();
        Hashtable<String, String> ht = new Hashtable<String, String>(100);
        
     

        %>



<%

String id = null;
id = (String)session.getAttribute("id");





ht.put("자연관광지","A0101");
ht.put("관광자원","A0102");
ht.put("역사관광지","A0201");
ht.put("휴양관광지","A0202");
ht.put("체험관광지","A0203"); 
ht.put("산업관광지","A0204"); 
ht.put("건축/조형물","A0205"); 
ht.put("문화시설","A0206"); 
ht.put("축제","A0207"); 
ht.put("공연/행사","A0208");
ht.put("레포츠소개","A0301"); 
ht.put("육상레포츠","A0302"); 
ht.put("수상레포츠","A0303"); 
ht.put("항공레포츠","A0304"); 
ht.put("5일장","A04010100"); 
ht.put("상설시장","A04010200"); 
ht.put("백화점","A04010300"); 
ht.put("면세점","A04010400"); 
ht.put("할인매장","A04010500"); 
ht.put("전문상가","A04010600");
ht.put("공예,공방","A04010700");
ht.put("관광기념품점","A04010800"); 
ht.put("특산물판매점","A04010900"); 
ht.put("한식","A05020100"); 
ht.put("서양식","A05020200"); 
ht.put("일식","A05020300"); 
ht.put("중식","A05020400"); 
ht.put("아시아식","A05020500"); 
ht.put("패밀리레스토랑","A05020600"); 
ht.put("이색음식점","A05020700");
ht.put("채식전문점","A05020800");
ht.put("바/까페","A05020900"); 
ht.put("클럽","A05021000"); 

request.setCharacterEncoding("utf-8"); //받아올 데이터의 인코딩

lat_str = request.getParameter("lat"); 
  lot_str = request.getParameter("lot");  

  sel=request.getParameter("sel");
tag = request.getParameter("tag");

areaCode= request.getParameter("areaCode");

String date_ ; 
String date ;
date =request.getParameter("date-start");
String min; 
min =request.getParameter("min");
int Nmin=Integer.parseInt(min);


date_=date.replace("T","").replace(":","").replace("-","");

cl_li=board.getlocation(areaCode, ht.get(sel));
hotel_li=board.set_check(Integer.valueOf(areaCode)); 

food_li=board.set_check2(Integer.valueOf(areaCode));

%>
<!DOCTYPE html>

<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Animate.css -->
		<link rel="stylesheet" href="css/animate.css">
		<!-- Icomoon Icon Fonts-->
		<link rel="stylesheet" href="css/icomoon.css">
		<!-- Bootstrap  -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<!-- Superfish -->
		<link rel="stylesheet" href="css/superfish.css">
		<!-- Magnific Popup -->
		<link rel="stylesheet" href="css/magnific-popup.css">
		<!-- Date Picker -->
		<link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
		
		<!-- main css -->
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/media-query.css">
<!-- 부가적인 테마 -->

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" type ="text/css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->

<style>
html, body {
   margin: 0;
   padding: 0;
   height: 100%;
   weight: 100%;
}

.fun1 {
   top: 600px;
}

.section {
   width: 70%;
   height: 100%;
   position: relative;
   z-index: 3;
}
#form-tab-panel{
width :100%;
position: absolute;
height: 15%;
}
.what{
width :30%;
left:700px;
bottom:0px;
position: absolute;
   z-index: 2;
height:350px;
}
.nav {
   width: 20%;
   height: 100%;
   top: 74px;
   left: 0px;
   position: absolute;
   z-index: 2;
}
.section{
width :100%;
height:100%;
}
.stored {
   folat: left;
   width: 100%;
   height: 100%;
}
.nav-item{

height:20%;
}
#ul_list {
   float: left;
   width: 100%;
   height: 100%;
   padding: 0;
}
.img-thumbnail{

width :200px; 
height :200px;

}
.aside {

width:20%; 
height: auto;
position: absolute;
right : 0px;
z-index :1;
}

.myTripTable {
width: 100%;
height: 250px;
font-size: 15pt;
text-align :left;
}
.myTrip-th1{

width: 10%;

}
.myTrip-th2{

width: 30%;

}
.myTrip-th3{

width: 25%;

}
.myTrip-th4{

width: 20%;

}
.myTrip-th5{

width: 15%;

}

.btn1{
width: 100pt;
height: 50pt;
}
.myTripTitle{
width: 100%;
height: 30pt;
font-size:20px;
}
.qqq{
width: 100%;
}

</style>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Fill My Trip</title>


<script
   src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxe87c4404b1584680a068fa692fe1b737"></script>
<script type="text/javascript">
var check="";
var insertList = [];
var infoWindow;
var infoWindowsList = [];
var init_list ;
var markerList=[];
var viaPoints = [];
var end = new Object();
var mytrip = []; //경로 저장 
var mydt= new Object(); //경로에 따른 시간,거리 저장
var cat1 = 0;      
var list_hap=0;      
var markerCluster;
var check_list = [];
var viaTime= [];
      var food_list =[];
      var session ="<%=id%>"; //세션 아이디 저장
      var trip_name;
        var selinfo;    
        var len ; 
            var cl_list = [];
            var time_travel  ="<%=Nmin%>";
            var lat1; 
            var lot1;
            var positions = [];
           var map;
            var stop_by = 0;
            var  resultMarkerArr = [];
            var markerInfo;
         var date_ ="<%=date_%>";
         
         //출발지,도착지 마커
         var marker_s, marker_e, marker_p;
         //경로그림정보
         var drawInfoArr = [];
         var drawInfoArr2 = [];
         var taxiFare = "";
         var chktraffic = [];
         var resultdrawArr = [];
            var pre_lat; 
           var pre_lot;
            var until;
        var hotel_list = [];
          var tFare1;
            var tindex;
            var every; 
            var marker_s;
           var cordinate ;
             var sel = new Array(cl_list.length);
            var bar_val = 0 ;   
            var tDistance = ""; 
           var amount_par=0;
           var sel_name;
           //좌표 나누어진 버전
         function Cl_obj(name ,lat, lot,ph,src,add )  {
            
               this.name =name; 
               this.lat = lat;
               this.lot = lot;
               cat1 = 0; 
               time =0;
               this.ph = ph; 
               this.src = src; 
               this.add = add;
         }
         function Cl_obj(name ,lat, lot,ph,src,add,cat1 )  {
             
             this.name =name; 
             this.lat = lat;
             this.lot = lot;
             this.cat1 = cat1; 
             time =0;
             this.ph = ph; 
             this.src = src; 
             this.add = add;
       }

           
      function goto_info(name){
         window.open("info.jsp?ti="+name ,"_self");
         
      };   
      
         
           
         function reset_position(){
            positions= [];
            
             if(list_hap===0){
               
               check_list=[];
               
               check_list=init_list;
               
            }
            else if((list_hap===1)&&(check=="food")){    
               check_list=[];
               
               cl_list=init_list;
               cl_list=cl_list.concat(hotel_list);
              
               check_list=cl_list;
            } 
            else if((list_hap===1)&&(check=="hotel")){    
               
               cl_list=init_list;
               check_list=[];
               cl_list=cl_list.concat(food_list);
                check_list=cl_list;
            }else{
               
               cl_list=init_list;
               check_list=[];
               cl_list=[...cl_list,...food_list,...hotel_list];
               check_list=cl_list;
            } 
             
             
             
             
             
             
             
             
             
            for (var i = 0; i<10 ; i++) 
                
            {
            sel[i] = { 
                title: '', 
               lonlat: new Tmapv2.LatLng(lat1,lot1),//좌표 지정
               time : 121,
               src : "", 
               ph :"", 
               add : "", 
               cat1 : "" 

            };
                       

            }

           
            for(var i=0; i<check_list.length+1;i++){
                 
                //tmap 에 표시되도록 나온 친구
                positions[i]=   {
                   title: 'me', 
                   lonlat: new Tmapv2.LatLng(lat1,lot1),//좌표 지정
                   time :0,
                   src :"aa", 
                   ph :"bb", 
                   add : "cc",
                  cat1 :""
                };  
         
             }
            for(var i=1; i<positions.length;i++){
                
                
                
                positions[i]=   {
                       title: check_list[i-1].name, 
                       lonlat: new Tmapv2.LatLng(check_list[i-1].lat,check_list[i-1].lot),//좌표 지정
                       time: check_list[i-1].time, 
                       src : check_list[i-1].src, 
                       ph : check_list[i-1].ph, 
                       add : check_list[i-1].add,
                       cat1: check_list[i-1].cat1
                       
                
                };  
                
                
                }

         }
           
           
           
           <%
        
      //메인페이지 폼에서 받아오는 정보   
        
    
   
     %>

                
            function make_list(amount) 
           {
              
               console.log("tlqkf");
               $("#ul_list").addClass("list-group");
                for(var i=0; i<amount-1; i++ )
                {
               var $img= $("<img src ="+check_list[i].src+" >");
               $img.addClass("img-thumbnail");
               
               var $span = $("<span></span>");
               $span.addClass("glyphicon glyphicon-chevron-right");
               var $button = $("<button> </button>").addClass("btn"); 
               $button.append($span);
               
               
               var $li = $("<li></li>");
               $li.addClass("list-group-item").append("<h4>"+check_list[i].name+"</h4>").append($img).append($button).append("<p>"+check_list[i].add+"</p>");
               
               $("#ul_list").append($li); 
               
                $('.list-group-item').on('click',function() {  
                   
                    
                   for(var j =0; j<amount; j++){
                   if($(this).children('h4').text()==positions[j].title) 
                      {
                      map.setZoom(5);
                      map.setCenter(positions[j].lonlat);
                                 
                      }
                   }
               }); 
               
               
                $('.btn').on('click',function() {  
                     
                    
                   for(var j =0; j<amount; j++){
                   if($(this).parent().children('h4').text()==positions[j].title) 
                      {
                      goto_info($(this).parent().children('h4').text());
                                        
                      }
                   }
               }); 
                
                
                
                
                
                }
             } 
                
               function make_selLi(){
                  
                  
                  $("#sel_ul").addClass("list-group");
                  var $span = $("<span></span>");
                   $span.addClass("glyphicon glyphicon-chevron-right");
                  var $img= $("<img src ="+sel[stop_by].src+" >");
                  $img.addClass("img-thumbnail");
                  var $button = $("<button> </button>").addClass("btn");
                  $button.append($span); 
                  var $label =$("</br><label>경유시간(분)     </label>").addClass("viatimelabel");
                    var $time = $("<input type='number' value='10'>").addClass("viatime");
                    var $button1 = $("<button>확정</button>").addClass("viabtn");
                    
                    var $li =$("<li></li>").addClass("list-group-item").append("<h3>"+stop_by+"</h3>").append("<h4>"+sel[stop_by].title+"</h4>").append($img).append($button).append($label).append($time).append($button1); 

                  
 
                  
                  
$("#sel_ul").append($li);
                  
                  $('.btn').on('click',function() {  
                     for(var j =0; j<positions.length; j++){
                        if($(this).parent().children('h4').text()==positions[j].title) 
                         {
                            //$(event.target).parent('li').remove();
                            $(event.target).closest("li").remove();
                            
                            
                            for(var i = 0;i<sel.length;i++){
                               
                               
                               if(sel[i].title==positions[j].title){
                                  
                                  sel.splice(i,1);
                                  
                                  insertList[i].setMap(null);
                                  insertList.splice(i,1);
                                  stop_by--;
                                  
                               }
                            
                            }
                                          
                         }
                      }
                  
               });
                  
                  $('.viabtn').on('click',function() {
                        for(var j =0; j<positions.length; j++){
                           if($(this).parent().children('h4').text()==positions[j].title) 
                            {
                              
                               
                               
                               for(var i = 0;i<sel.length;i++){
                                  
                                  
                                  if(sel[i].title==positions[j].title){
                                     
                                     viaTime[i]= ($( '.viatime' ).val()*60);
                                     
                                  }
                                  
                               }
                               
                               
                               
                                              
                            }
                         }
                           
                           
                        } );
               } 
               function more(){
                  if(end==null){
                     alert("경로탐색을 한후에 눌러주세요");
                  }else{
                     
                  }
               }
 function bar(){
           
           document.getElementById('bar').value = bar_val +"";
        }
function set_max(){
           
           document.getElementById('bar').max = time_travel +"";
        }
     
            function initTmap(){
               
               

               make_list(check_list.length);
               
                 map = new Tmapv2.Map("map_div",  
            {
               center: new Tmapv2.LatLng(lat1,lot1), // 지도 초기 좌표
               width: "100%", 
               height: "100%",
               
               zoom: 11 ,
               zIndexMarker :2, 
               zIndexInfoWindow :3
            });
                 

              //다중 마커 저장 배열
                   
                
                  
                  
              
               
                addfood();
              
               
            

            
            
            
            
            }//// init
             
            function onClose(count1){
               
               
               infoWindowsList[count1].setVisible(false);
             }
            
            function enterListener(marker,lonlat){
              marker.addListener("mouseenter", function(evt) {
                 marker.animate(Tmapv2.MarkerOptions.ANIMATE_BOUNCE);
                 
              });
           
           }
           function leaveListener(marker){
              marker.addListener("mouseleave", function(evt) {
                 marker.stopAnimation();
              });
           }
            
            
            function reload_maker(){
               
               reset_map();
               
               
            }
             
           

            function addMarker( lon, lat, tag,title, src,ph, add ,lonlat2) {
            //출도착경유구분
            //이미지 파일 변경.
         
               
            var count=0;
            
            

                var content = "<div style='position: static; display: flex; flex-direction: column; font-size: 16px; box-shadow: 5px 5px 5px #00000040; border-radius: 10px; top: 410px; left : 800px; width : 250px; background: #FFFFFF 0% 0% no-repeat padding-box;'>"+
                "<div class='img-box' style='position: relative; width: 100%; height: 150px; border-radius: 10px 10px 0 0 ; background: #f5f5f5 url("+src+") no-repeat center;background-size : cover;'>"+
                "</div>"+
                "<div class='info-box' style='padding: 10px;'>"+
                "<p style='margin-bottom: 7px; overflow: hidden;'>"+
                "<span class='tit' style=' font-size: 16px; font-weight: bold;'>"+title+"</span>"+
                "<a href='http://tmapapi.sktelecom.com/' target='_blank' class='link' style='color: #3D6DCC; font-size: 13px; float: right;'>홈페이지</a>"+
                "</p>"+
                "<ul class='ul-info'>"+
                "<li class='li-addr' style= 'list-style-image : url(./images/Paomedia-Small-N-Flat-Map-marker.svg); padding-left: 5px; margin-bottom: 5px; background: url() no-repeat top 3px left;'>"+
                "<p class='new-addr'>"+add+"</p>"+
                "</li>"+
                "<li class='li-tell' style= 'list-style-image : url(./images/Paomedia-Small-N-Flat-Phone.svg); padding-left: 5px; margin-bottom: 5px; background: url() no-repeat top 3px left;'>"+
                "<span class='tell'>"+ph+"</span>"+
                "</li>"+
                "</ul>"+
                
                "</div>"+
                "<a href='javascript:void(0)' onclick='onClose("+count+");' class='btn-close' style='position: absolute; top: 10px; right: 10px; display: block; width: 15px; height: 15px; background: url() no-repeat center;color: black;'>X</a>"+
                "</div>";
            
            
                
                
                 marker_s = new Tmapv2.Marker({
               position: new Tmapv2.LatLng(lat,lon),
               icon: 'http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png',
               map: map,
               title : title
               
                 });
                 
                 infoWindowsList.push(infoWindow);
                addListener(marker_s,lonlat2,content,count);
             markerList[tag] = marker_s;
             insertList.push( marker_s);
             
             count++;
             
         
            
             function addListener(marker,lonlat2,content,count){
                  
                  
                  marker.addListener("click", function(evt) {
                  //Popup 객체 생성.
                     if(infoWindowsList[count] !=null){
                        infoWindowsList[count].setVisible(false);

                           
                     }
                        infoWindowsList[count] = new Tmapv2.InfoWindow({
                              position: lonlat2, //Popup 이 표출될 맵 좌표
                              content: content , //Popup 표시될 text
                              type: 2, //Popup의 type 설정.f
                              map: map, //Popup이 표시될 맵 객체
                              title : title
                              
                        });
                        
                  
                  });      
                  
                  }  //addListener
                   
            }
            
            
            
         function marker_hap(){
            
            list_hap=list_hap+1;
         }
 function marker_init(){
            
            list_hap=0;
         }  
            
            function onclose_beta(count1){
              infoWindowList1[count1].setVisible(false);
              
           } 
            
            function onInsert (){
               
               for (var i = 1; i<positions.length; i++){
                 
                 if(String(infoWindowsList[0].getPosition()) ==String(positions[i].lonlat)) {
                    
                     sel[stop_by]=positions[i];
                     
                  
                 
                  if(bar_val<=time_travel)
                    {
                     
                    
                    for(var j =0; j<cl_list.length; j++){
                     if((sel[stop_by].title==cl_list[j].name)&&(stop_by==0)){
                        get_time(lot,lat,cl_list[j].lot , cl_list[j].lat);
                           pre_lot=    cl_list[j].lot; 
                           pre_lat=    cl_list[j].lat;
                            bar_val =bar_val+until;
                            
                            bar(bar_val);
                            make_selLi();
                            stop_by++;
                            
                           
                           // addElement(cl_list[j].name, cl_list[j].src);
                           
                            infoWindowsList[0].setVisible(false);
                            
                            addMarker(cl_list[j].lot,cl_list[j].lat,stop_by,cl_list[j].name,cl_list[j].src,cl_list[j].add,cl_list[j].ph,positions[i].lonlat);
                            
                            //addelement
                            
                            
                          
                   
                     }
                     else if(sel[stop_by].title==cl_list[j].name){
                        get_time(pre_lot,pre_lat,cl_list[j].lot , cl_list[j].lat);
                        pre_lot=  cl_list[j].lot; 
                        pre_lat=  cl_list[j].lat;
                         bar_val =bar_val+until;
                         bar(bar_val);
                         make_selLi();
                         stop_by++;
                         
                         
                        // addElement(cl_list[j].name,cl_list[j].src);
                         infoWindowsList[0].setVisible(false);
                         addMarker(cl_list[j].lot,cl_list[j].lat,stop_by,cl_list[j].name,cl_list[j].src,cl_list[j].add,cl_list[j].ph,positions[i].lonlat);
                         
                         
                     }
                     
                    
                    }
                      
                     
                    
                    
                    //infoWindowsList[0].setVisible(false);
                    
                       
                       
                    
                    } 
                  else {
                     
                     alert("이동시간을 초과하셨습니다.");      
                    
                     
                     infoWindowsList[0].setVisible(false);
                      }
                 
                  
                  
               
                    }
                 else {
                    
                 }
               }
               
               
            }
         
            
            
            function reset_sel(){
               for(var i=0;i<sel.length; i++){
               if(sel[i].title=="me")
                  {
                  sel.splice(i,1);
                  }
               }
               }   
          function get_course(pass) {

             //기존 맵에 있던 정보들 초기화
             
             reset_map();
             
             
            
             
             
             
             //JSON TYPE EDIT [S]
             $
                   .ajax({
                      type : "POST",
                      url : "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result",
                      async : false,
                      data : {
                         "appKey" : "l7xxe87c4404b1584680a068fa692fe1b737",
                         "startX" : lot,
                         "startY" : lat,
                         "endX" : 126.907161 ,
                         "endY" : 37.515575,
                         "passList" : pass,
                         "reqCoordType" : "WGS84GEO",
                         "resCoordType" : "EPSG3857",
                         "searchOption" : "0",
                         "trafficInfo" : "Y"
                      },
                      success : function(response) {

                         var resultData = response.features;

                          tDistance = "총 거리 : "
                               + (resultData[0].properties.totalDistance / 1000)
                                     .toFixed(1) + "km,";
                          tTime = " 총 시간 : "
                               + (resultData[0].properties.totalTime / 60)
                                     .toFixed(0) + "분,";
                         var tFare = " 총 요금 : "
                               + resultData[0].properties.totalFare
                               + "원,";
                          taxiFare = " 예상 택시 요금 : "
                               + resultData[0].properties.taxiFare
                               + "원";
                         tindex = resultData[0].properties.name;
                        alert(tindex);
                        
                         //교통정보 표출 옵션값을 체크
                         //if (trafficInfochk == "Y") {
                            for ( var i in resultData) { //for문 [S]
                               var geometry = resultData[i].geometry;
                               var properties = resultData[i].properties;

                               if (geometry.type == "LineString") {
                                  //교통 정보도 담음
                                  chktraffic
                                        .push(geometry.traffic);
                                  var sectionInfos = [];
                                  var trafficArr = geometry.traffic;

                                  for ( var j in geometry.coordinates) {
                                     // 경로들의 결과값들을 포인트 객체로 변환  
                                     
                                     var latlng = new Tmapv2.Point(
                                           geometry.coordinates[j][0],
                                           geometry.coordinates[j][1]);
                                     // 포인트 객체를 받아 좌표값으로 변환
                                     var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
                                           latlng);

                                     sectionInfos
                                           .push(convertPoint);
                                  }
                                  
                                  drawLine(sectionInfos,
                                        trafficArr);
                               } else {

                                  var markerImg = "";
                                  var pType = "";

                                  if (properties.pointType == "S") { //출발지 마커
                                     markerImg = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
                                     pType = "S";
                                  } 

                                  // 경로들의 결과값들을 포인트 객체로 변환 
                                  var latlon = new Tmapv2.Point(
                                        geometry.coordinates[0],
                                        geometry.coordinates[1]);
                                  // 포인트 객체를 받아 좌표값으로 다시 변환
                                  var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
                                        latlon);

                                    var routeInfoObj = {
                                     markerImage : markerImg,
                                     lng : convertPoint._lng,
                                     lat : convertPoint._lat,
                                     pointType : pType
                                  };  
                                  // 마커 추가
                                  
                               }
                               
                            }//for문 [E]
    //여까지임
                         //} 
                      },
                      error : function(request, status, error) {
                         console.log("code:"
                               + request.status + "\n"
                               + "message:"
                               + request.responseText
                               + "\n" + "error:" + error);
                      }
                   });
             //JSON TYPE EDIT [E]
            alert(tTime); 
            alert(taxiFare); 
            alert(tDistance); 
         
          }


    function addComma(num) {
    var regexp = /\B(?=(\d{3})+(?!\d))/g;
    return num.toString().replace(regexp, ',');
    } 
   
 
    //마커 생성하기
     function addMarkers(infoObj) {
    var size = new Tmapv2.Size(24, 38);//아이콘 크기 설정합니다.

    if (infoObj.pointType == "P") { //포인트점일때는 아이콘 크기를 줄입니다.
    size = new Tmapv2.Size(8, 8);
    }

    marker_p = new Tmapv2.Marker({
    position : new Tmapv2.LatLng(infoObj.lat, infoObj.lng),
    title : sel[stop_by].title,
    icon : infoObj.markerImage,
    iconSize : size,
    map : map
    });


    } 

    //라인그리기
    function drawLine(arrPoint, traffic) {
    var polyline_;

    if (chktraffic.length != 0) {

    // 교통정보 혼잡도를 체크
    // strokeColor는 교통 정보상황에 다라서 변화
    // traffic :  0-정보없음, 1-원활, 2-서행, 3-지체, 4-정체  (black, green, yellow, orange, red)

    var lineColor = "";

    if (traffic != "0") {
       
    if (traffic.length == 0) { //length가 0인것은 교통정보가 없으므로 검은색으로 표시
       
       lineColor = "#06050D";
       //라인그리기[S]
       polyline_ = new Tmapv2.Polyline({
          path : arrPoint,
          strokeColor : lineColor,
          strokeWeight : 6,
          map : map
       });
       resultdrawArr.push(polyline_);
       //라인그리기[E]
    } else { //교통정보가 있음
       
       if (traffic[0][0] != 0) { //교통정보 시작인덱스가 0이 아닌경우
          var trafficObject = "";
          var tInfo = [];

          for (var z = 0; z < traffic.length; z++) {
             trafficObject = {
                "startIndex" : traffic[z][0],
                "endIndex" : traffic[z][1],
                "trafficIndex" : traffic[z][2],
             };
             tInfo.push(trafficObject)
          }

          var noInfomationPoint = [];

          for (var p = 0; p < tInfo[0].startIndex; p++) {
             noInfomationPoint.push(arrPoint[p]);
          }

          //라인그리기[S]
          polyline_ = new Tmapv2.Polyline({
             path : noInfomationPoint,
             strokeColor : "#06050D",
             strokeWeight : 6,
             map : map
          });
          //라인그리기[E]
          resultdrawArr.push(polyline_);

          for (var x = 0; x < tInfo.length; x++) {
             var sectionPoint = []; //구간선언
             
             for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
                sectionPoint.push(arrPoint[y]); 
                
             }

             if (tInfo[x].trafficIndex == 0) {
                lineColor = "#06050D";
             } else if (tInfo[x].trafficIndex == 1) {
                lineColor = "#61AB25";
             } else if (tInfo[x].trafficIndex == 2) {
                lineColor = "#FFFF00";
             } else if (tInfo[x].trafficIndex == 3) {
                lineColor = "#E87506";
             } else if (tInfo[x].trafficIndex == 4) {
                lineColor = "#D61125";
             }

             //라인그리기[S]
             polyline_ = new Tmapv2.Polyline({
                path : sectionPoint,
                strokeColor : lineColor,
                strokeWeight : 6,
                map : map
             });
             //라인그리기[E]
             resultdrawArr.push(polyline_);
          }
       } else { //0부터 시작하는 경우
       
          var trafficObject = "";
          var tInfo = [];

          for (var z = 0; z < traffic.length; z++) {
             trafficObject = {
                "startIndex" : traffic[z][0],
                "endIndex" : traffic[z][1],
                "trafficIndex" : traffic[z][2],
             };
             tInfo.push(trafficObject)
          }

          for (var x = 0; x < tInfo.length; x++) {
             var sectionPoint = []; //구간선언

             for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
                sectionPoint.push(arrPoint[y]);
             }

             if (tInfo[x].trafficIndex == 0) {
                lineColor = "#06050D";
             } else if (tInfo[x].trafficIndex == 1) {
                lineColor = "#61AB25";
             } else if (tInfo[x].trafficIndex == 2) {
                lineColor = "#FFFF00";
             } else if (tInfo[x].trafficIndex == 3) {
                lineColor = "#E87506";
             } else if (tInfo[x].trafficIndex == 4) {
                lineColor = "#D61125";
             }

             //라인그리기[S]
             polyline_ = new Tmapv2.Polyline({
                path : sectionPoint,
                strokeColor : lineColor,
                strokeWeight : 6,
                map : map
             });
             //라인그리기[E]
             resultdrawArr.push(polyline_);
          }
       }
    }
    } else {

    }

    } else {
    polyline_ = new Tmapv2.Polyline({
    path : arrPoint,
    strokeColor : "#DD0000",
    strokeWeight : 6,
    map : map
    });
    resultdrawArr.push(polyline_);
    }

    }
            
            
            function get_time(startx,starty,endx,endy) {

                  //기존 맵에 있던 정보들 초기화
                          
                                
                      
                  
                      
                      
                      //JSON TYPE EDIT [S]
                  $
                        .ajax({
                           type : "POST",
                           url : "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result",
                           async : false,
                           data : {
                              "appKey" : "l7xxe87c4404b1584680a068fa692fe1b737",
                              "startX" : startx,
                              "startY" :starty,
                              "endX" : endx, 
                              "endY" : endy,
                              "reqCoordType" : "WGS84GEO",
                              "resCoordType" : "EPSG3857"
                                 
                           },
                           success : function(response) {
                              
                              var resultData = response.features;

                             var  tDistance = "총 거리 : "
                                    + (resultData[0].properties.totalDistance / 1000)
                                          .toFixed(1) + "km,";
                              var tTime = " 총 시간 : "
                                    + (resultData[0].properties.totalTime / 60)
                                          .toFixed(0) + "분,";
                              var tFare = " 총 요금 : "
                                    + resultData[0].properties.totalFare
                                    + "원,";
                              var taxiFare = " 예상 택시 요금 : "
                                    + resultData[0].properties.taxiFare
                                    + "원";
                              
                              

                              $("#result").text(
                                    tDistance + tTime + tFare
                                          + taxiFare);
                              
                              //교통정보 표출 옵션값을 체크
                            until   =((resultData[0].properties.totalTime / 60).toFixed(0))*1;
                              
                            
                              
                           },
                           error : function(request, status, error) {
                              console.log("code:"
                                    + request.status + "\n"
                                    + "message:"
                                    + request.responseText
                                    + "\n" + "error:" + error);
                           }
                        });
                  //JSON TYPE EDIT [E]
               
               
               }
               
            function reset_map(){
                
               if (resultMarkerArr.length > 0) {
                   for (var i = 0; i <resultMarkerArr.length; i++) {
                      resultMarkerArr[i].setMap(null);
                   
                   }
                   
               }
             
                
                if (resultdrawArr.length > 0) {
                   for (var i = 0; i < resultdrawArr.length; i++) {
                      resultdrawArr[i].setMap(null);
                   }
                }
                markerCluster.destroy();   
             resultMarkerArr = [];
             resultdrawArr = [];
            }

                  
           
            
               function aaaa(tTime){
                  
                  
                  document.getElementById('aaa').value =  tTime;
               }
            
           
                       
       

               function get_via(){
                     
                     
                     
                     for (var i = 0; i < sel.length; i++) {

                        
                        for (var j = 0; j < cl_list.length; j++) {
                           if (sel[i].title == cl_list[j].name) {
                              if(viaTime.length==0){
                                 viaPoints.push({
                                    viaPointId : cl_list[j].name,
                                    viaPointName : cl_list[j].name,
                                    viaX : cl_list[j].lot,
                                    viaY : cl_list[j].lat,
                                    viaTime: 600
                                    

                                 });
                              }else{
                                 viaPoints.push({
                                    viaPointId : cl_list[j].name,
                                    viaPointName : cl_list[j].name,
                                    viaX : cl_list[j].lot,
                                    viaY : cl_list[j].lat,
                                    viaTime: viaTime[i]
                                    

                                 });
                                 
                              }
     

                           }
                        }
                        
                        

                     }
                     
                     

                  };
   
   
     function get_end(){  // end좌표값 구하기
         
          
          
          var start = new Object();
          
          start.latitude = Number(lat);
          start.longitude = Number(lot);
       
           
          var distance= 0;   
           
         var b =new Object();
         var temp = 0;
         var r = 6371; //지구의 반지름(km)
         var c= 0;
         
         
          function deg2rad(deg) {
                 return deg * (Math.PI/180)
             }
         
      for(var i = 0; i< viaPoints.length;i++){
         
         b.latitude = Number(viaPoints[i].viaY);
            b.longitude = Number(viaPoints[i].viaX);
         
         a =calcDistance(lat,lot,b.latitude,b.longitude);
      
   
           
         

         if (Math.abs(a)>Math.abs(temp)){
            
            c = i;
            temp = a;
            
            end.name = viaPoints[i].viaPointName;
            end.x = viaPoints[i].viaX;
            end.y = viaPoints[i].viaY;
            end.time = viaPoints[i].viaTime;
         }
 
      }
      if(viaPoints.length ==1){
         
      }else{
         viaPoints.splice(c,1);   
      }
      
      
   };
   
   
// 경도 위도 거리 구하기
   function calcDistance(lat1,lot1,lat2,lot2){
      
      var theta = lot1-lot2;
      var dist = Math.sin(deg2rad(lat1))*Math.sin(deg2rad(lat2))+Math.cos(deg2rad(lat1))*Math.cos(deg2rad(lat2))*Math.cos(deg2rad(theta));
      
      dist= Math.acos(dist);
      dist = rad2deg(dist);
      dist= dist* 60 *1.1515;
      dist = dist *1.609344;
      
      return Number(dist).toFixed(2);
   }
   
   function deg2rad(deg){
      return (deg*Math.PI/180.0);
   }
   function rad2deg(rad){
      return (rad*180/Math.PI);
   }

//////////////////////////////////////////////////////////////////////   


   

   

   var routeLayer;
   function web2() {
         
        

         
         
         var headers = {};
         headers["appKey"] = "l7xxe87c4404b1584680a068fa692fe1b737";
         headers["Content-Type"] = "application/json";
         
         var param = JSON.stringify({
            "startName" : "출발지",
            "startX" : lot,
            "startY" : lat,
            "startTime" : date_,
            "endName" : "도착지",
            "endX" : end.x,
            "endY" : end.y,
            "viaPoints" : viaPoints,
            "reqCoordType" : "WGS84GEO",
            "resCoordType" : "EPSG3857",
            "searchOption" : "0",
            "trafficInfo" : "Y"
         });
         

         $
               .ajax({
                  method : "POST",
                  url : "https://apis.openapi.sk.com/tmap/routes/routeSequential30?version=1&format=json",//
                  headers : headers,
                  async : false,
                  data : param,
                  success : function(response) {
                     
                     var resultData = response.properties;
                     var resultFeatures = response.features;
                     

                     // 결과 출력
                     var tDistance = "총 거리 : " + resultData.totalDistance
                           / 1000 + "km  ";
                     var tTime = "총 시간 : "
                           + (resultData.totalTime / 60).toFixed(0)
                           + "분    ";
                     var tFare = "총 요금 : " + resultData.totalFare + "원";

                     $("#result").text(tDistance + tTime + tFare);
                     
                     
                     mydt.distance =resultData.totalDistance/ 1000;
                     mydt.time= (resultData.totalTime / 60).toFixed(0);
                     

                     //기존  라인 초기화
                     
    
                     /* if (resultInfoArr.length > 0) {
                        for ( var i in resultInfoArr) {
                           resultInfoArr[i].setMap(null);
                        }
                        resultInfoArr = [];
                     } */

                     for ( var i in resultFeatures) {
                        var geometry = resultFeatures[i].geometry;
                        var properties = resultFeatures[i].properties;
                        
                        var polyline_;

                        drawInfoArr = [];
                         

                        if (geometry.type == "LineString") {
                           
                           var trafficArr = geometry.traffic;
                           
                           chktraffic
                                   .push(geometry.traffic);
                           
                           for ( var j in geometry.coordinates) {
                              // 경로들의 결과값(구간)들을 포인트 객체로 변환 
                              var latlng = new Tmapv2.Point(
                                    geometry.coordinates[j][0],
                                    geometry.coordinates[j][1]);
                              // 포인트 객체를 받아 좌표값으로 변환
                              var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
                                    latlng);
                              // 포인트객체의 정보로 좌표값 변환 객체로 저장
                              var convertChange = new Tmapv2.LatLng(
                                    convertPoint._lat,
                                    convertPoint._lng);

                              drawInfoArr.push(convertChange);
                           }
                            

                             polyline_ = new Tmapv2.Polyline({
                              path : drawInfoArr,
                              strokeColor : "#FF0000",
                              strokeWeight : 6,
                              map : map
                           }); 
                           /* resultInfoArr.push(polyline_); */ 
                             /* drawLine(drawInfoArr,
                                              trafficArr);  */

                        } else {
                           var markerImg = "";
                           var size = ""; //아이콘 크기 설정합니다.

                           if (properties.pointType == "S") { //출발지 마커
                              markerImg = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
                              size = new Tmapv2.Size(24, 38);
                           } else if (properties.pointType == "E") { //도착지 마커
                              markerImg = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
                              size = new Tmapv2.Size(24, 38);
                           } else { //각 포인트 마커
                              markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
                              size = new Tmapv2.Size(8, 8);
                           }

                           // 경로들의 결과값들을 포인트 객체로 변환 
                           var latlon = new Tmapv2.Point(
                                 geometry.coordinates[0],
                                 geometry.coordinates[1]);
                           // 포인트 객체를 받아 좌표값으로 다시 변환
                           var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
                                 latlon);

                           marker_p = new Tmapv2.Marker({
                              position : new Tmapv2.LatLng(
                                    convertPoint._lat,
                                    convertPoint._lng),
                              icon : markerImg,
                              iconSize : size,
                              map : map
                           });                
                           
                           if(properties.viaPointName =="[0] 출발지"){
                                 mytrip.push({viatime:0, x: lot,y:lat,index: "S", name:properties.viaPointName.substring(4), time: properties.arriveTime , distance: (properties.distance / 1000).toFixed(1)});
                              }else if(properties.viaPointName =="[0] 도착지"){
                                 if(viaPoints.length==1 && viaPoints[0].viaPointName == end.name){
                                    
                                 }else{
                                	 
                                        	 mytrip.push({viatime:end.time,x: end.x,y:end.y,index: "E", name:end.name , time: properties.arriveTime , distance: (properties.distance / 1000).toFixed(1)});
                                    
                                    
                                 }
                                 
                              }else{
                                 
                                 if(viaPoints.length==1 && viaPoints[0].viaPointName == end.name){
                                    mytrip.push({viatime:0,x: end.x,y:end.y,index: "E", name:properties.viaPointName.substring(4), time: properties.arriveTime , distance: (properties.distance / 1000).toFixed(1)});
                                 }else{
                                    for(var k=0; k<viaPoints.length;k++){
                                       if(viaPoints[k].viaPointName== properties.viaPointName.substring(4)){
                                          mytrip.push({viatime:viaPoints[k].viaTime,x:viaPoints[k].viaX ,y:viaPoints[k].viaY,index: properties.index, name:properties.viaPointName.substring(4), time: properties.arriveTime , distance: (properties.distance / 1000).toFixed(1)});
                                       }
                                       
                                    }
                                    
                                 }
                                 
                                 
                                 
                              }

                           
                           
                        /*    alert("index"+properties.index);
                           alert("index"+properties.viaPointName);
                           
                           alert("time: "+properties.arriveTime);
                           alert("index:     "+(properties.distance / 1000).toFixed(1)); 
                            */

                           resultMarkerArr.push(marker_p);
                        }
                     }
                     
                     
                  },/////////////////
                  error : function(request, status, error) {
                     alert("실패");
                     console.log("code:" + request.status + "\n"
                           + "message:" + request.responseText + "\n"
                           + "error:" + error);
                  }
               });

      }
   
   function addfood(){//마커생성에 대한 함수 reset_map 해가지고 갔다가 받치면됨
         
      
      
      
        for (var i = 0; i< positions.length; i++){//for문을 통하여 배열 안에 있는 값을 마커 생성
           
           var lonlat = positions[i].lonlat;
           var title = positions[i].title;
           var ph = positions[i].ph; 
           var add = positions[i].add;
           var src = positions[i].src;
         
           var count =0;
           
              var content =  "<div style='position: static; display: flex; flex-direction: column; font-size: 16px; box-shadow: 5px 5px 5px #00000040; border-radius: 10px; top: 410px; left : 800px; width : 250px; background: #FFFFFF 0% 0% no-repeat padding-box;'>"+
               "<div class='img-box' style='position: relative; width: 100%; height: 150px; border-radius: 10px 10px 0 0 ; background: #f5f5f5 url("+src+") no-repeat center;background-size : cover;'>"+
               "</div>"+
               "<div class='info-box' style='padding: 10px;'>"+
               "<p style='margin-bottom: 7px; overflow: hidden;'>"+
               "<span class='tit' style=' font-size: 16px; font-weight: bold;'>"+title+"</span>"+
               "<a href='http://tmapapi.sktelecom.com/' target='_blank' class='link' style='color: #3D6DCC; font-size: 13px; float: right;'>홈페이지</a>"+
               "</p>"+
               "<ul class='ul-info'>"+
               "<li class='li-addr' style= 'list-style-image : url(./images/Paomedia-Small-N-Flat-Map-marker.svg); padding-left: 5px; margin-bottom: 5px; background: url() no-repeat top 3px left;'>"+
               "<p class='new-addr'>"+add+"</p>"+
               "</li>"+
               "<li class='li-tell' style= 'list-style-image : url(./images/Paomedia-Small-N-Flat-Phone.svg); padding-left: 5px; margin-bottom: 5px; background: url() no-repeat top 3px left;'>"+
               "<span class='tell'>"+ph+"</span>"+
               "</li>"+
               "</ul>"+
               "<ul class='btn-group' style='display: table; width: 100%; border-radius: 3px; height: 30px; border: 1px solid #EFEFEF; margin-top: 10px; text-align: center;'>"+
               "<li style= 'list-style-image : url(./images/Paomedia-Small-N-Flat-Map-marker.svg); width: 100%; margin-bottom: 5px; background: url() no-repeat top 3px left;'>"+
               "<a href='javascript:void(0)' onclick='onInsert()' title='경로탐색'>경로 추가</a>"+
               "</li>"+
               
             
               "</ul>"+
               "</div>"+
               "<a href='javascript:void(0)' onclick='onClose("+count+")' class='btn-close' style='position: absolute; top: 10px; right: 10px; display: block; width: 15px; height: 15px; background: url() no-repeat center;color: black;'>X</a>"+
               "</div>";
                var ma;
                if(positions[i].cat1=="B02"){
               
                  ma ="https://i.ibb.co/x176bCF/restaurant-1.png";
                } 
                else if(positions[i].cat1=="A05"){
                    
                     
                   ma = "https://i.ibb.co/3T9zJBd/real.png"                
                
                
                }else if(positions[i].title=="me"){
                    
                   
                   ma = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_s.png"                
                
                
                }else{
                    
                   
                   ma = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png"                
                
                
                }
                
                //Marker 객체 생성.
           marker = new Tmapv2.Marker({
              position : lonlat, //Marker의 중심좌표 설정.
              map : map, //Marker가 표시될 Map 설정.
              title : title, //Marker 타이틀.
              icon :ma ,
              zIndex: 1 ,
              animation:null, //Marker 애니메이션.
                 animationLength: 500 //애니메이션 길이.
             });
           marker.setMap(map); 
           enterListener(marker,lonlat);
         leaveListener(marker);
        
              if(title== "me"){
                  
                    } 
                else{
                       infoWindowsList.push(infoWindow);
                        addListener(marker,lonlat,content,title,count);
                        resultMarkerArr.push(marker);  
                        count++;
                    }
             
             
           
          
      
        }
      
        markerCluster = new Tmapv2.extension.MarkerCluster({
         markers: resultMarkerArr, // 마커들이 담긴 배열
         map: map // 지도 객체
      });
        
      
   } 
    function addListener(marker,lonlat2,content,title,count){
       
         
         marker.addListener("click", function(evt) {
         //Popup 객체 생성.
            if(infoWindowsList[count] !=null){
               infoWindowsList[count].setVisible(false);

                  
            }
               infoWindowsList[count] = new Tmapv2.InfoWindow({
                     position: lonlat2, //Popup 이 표출될 맵 좌표
                     content: content , //Popup 표시될 text
                     type: 2, //Popup의 type 설정.f
                     map: map, //Popup이 표시될 맵 객체
                     zIndex :2,
                     title : title
                     });
            
         
         });
         
    }  
    
      function check_usetime(){
            if(useTime1 > useTime){
               alert("시간을 초과하였습니다");
               
               location.reload();
            }
         }
         
         
         
         $(document).ready(function(){
             $("#btn_mytriptitle").click(function(){
                 $.ajax({
                     url:'./checkmytitle.jsp?title='+$('#myTripTitle').val(),
                     type:'post',
                     datatype : 'text',
                     success:function(data){
                         
                         $('.double_result2').html(data)
                     },
                     error:function(xhr,textStatus,errorThrown){
                         $('.double_result2').html('ERROR');
                     }
                 })
             })
         })
         
         
         function checkValue()
              {
             var form = document.mytripform;
                 
               if(!form.myTripTitle.value){
                   alert("여행 이름을 입력하세요.");
                   return false;
               }
               
           
              }

    
</script>



</head>
<body
   onload="set_max(); show_where(); reset_position(); initTmap();  <!-- make_maker(); --> ">
   <header id="delcd-header-section" class="sticky-banner">
			<div class="container">
				<div class="nav-header">
					<a href="#" class="js-delcd-nav-toggle delcd-nav-toggle dark"><i></i></a>
					<h1 id="delcd-logo"><a href="index.jsp"><img id="travel-icon" src="" alt="" /> Fill My Trip</a></h1>
					
					<!-- start navbar -->
					<nav id="delcd-menu-wrap">
						<ul class="sf-menu" id="delcd-primary-menu">
							<li><a href="index.jsp">Home</a></li>
							<li><a href="areaSelect.jsp">Fill My Trip</a></li>
							<li><a href="tripboard.jsp">Travel Sharing</a></li>
							<li><a href="faqboard.jsp">FAQ</a></li>
							<li>
							<%if(session.getAttribute("id") == null) {
								%>
								<li><a href="login.jsp">Login</a></li>
								<%
								}else{
									%>
									<li><a href="#" class="delcd-sub-ddown">My Page</a>
									<ul class="delcd-sub-menu">
									<li><a href="login.jsp">My Page</a></li>
									<li><a href="logout.jsp">Logout</a></li>
								</ul>
								</li>
								<%} %>
							</li>
							
						</ul>
					</nav>
					<!-- end navbar -->
					
				</div>
			</div>
		</header>
<div class="what">
								 <!-- Nav tabs -->
								   <ul id="form-tab-panel" class="nav nav-tabs" style="width:100%;">
								      <li class="nav-item" ">
								      	<a id ="3 class="nav-link" href="#hotels" data-toggle="tab" style="pointer-events: none;">지역설정</a>
								      </li>
								      <li class="nav-item">
								    	   <a   id ="2" class="nav-link" href="#trains" data-toggle="tab" style="pointer-events: none;" >여행 테마 만들기</a>
								      </li>
									  <li class="nav-item" >
								    	   <a  id ="1" class="nav-link active" href="#flights" data-toggle="tab">코스 만들기</a>
								      </li>
								   </ul>
								<br> 
								<br> 
								<br>
								<br> 
								<br>
								
								<div class="tabulation">

								 

								   <!-- Tab panes -->
								   <div class="tab-content">
									
									 <!-- start tab flights -->
									 <div class="tab-pane active" id="flights">
										 <form>
										  <!-- start destination -->
										  <div class="form-row">										  
											<div class="col-sm-6">
											 <div class="form-group">
												<br> 
												<br>
											 </div>
											</div>
											
											<div class="col-sm-6">
											  <div class="form-group">
												<br> 
												<br>
											  </div>
											</div>
										  </div>
										  <!-- end destination -->
										  
										  <!-- start check in -->
										  <div class="form-row">										  
											<div class="col-sm-6">
											 <div class="form-group">
												<label>식당:</label>
												<input type="checkbox" id ="hotelcheck" value ="">
            									<hr>	
											 </div>
											</div>
											
											<div class="col-sm-6">
											  <div class="form-group">
												<label>숙박:</label>
												<input type="checkbox" id ="hotelcheck2" value ="">
											  <hr>
											  </div>
											</div>
										  </div>
										  <!-- end check in -->
										  
										  <!-- start class -->		
										  <div class="form-row">										  
											<div class="col-sm-12">
											 <div class="form-group">
												<label>Time Limit</label> 
												<br>
												<progress id="bar" value="0" max="min" style ="width:70%; height:40px;"> 32% </progress> 
											 <hr>
											 </div>
											</div>
										  </div>
										  <!-- end class -->
										  
										  <!-- start age -->		
										  <div class="form-row">										  
											<div class="col-md-6">
											 <div class="form-group">
												<label>코스확정:</label>
												<br>
												<input type="button" class ="btn btn-primary btn-lg" value="get_time" id= "btn_select"
            												onclick=" reload_maker(); reset_sel(); get_via();get_end(); web2(); ">
											 <hr>
											 </div>
											</div>
											
											<div class="col-md-6">
											 <div class="form-group">
												<label>처음으로:</label>
												<br>
												<button type="button" onclick="location.href='./areaSelect.jsp'" class="btn btn-primary btn-lg" >
  													처음으로 돌아가기
													</button>
											 <hr>
											 </div>
											</div>
										  </div>
										  <!-- end age -->
										  
										  <div class="form-row">										  
											<div class="col-sm-12">
												<label>경로저장:</label>
												<button type="button" class="btn btn-primary btn-lg" id="asd"> 경로 저장하기</button>
												
											</div>
										  </div>	
										  
										</form>
									 </div>
									 <!-- end tab flights -->
									 
									  <!-- start tab trains -->
									 <div class="tab-pane" id="trains">
										 <form>
										  <!-- start destination -->
										  <div class="form-row">										  
											<div class="col-sm-6">
											 <div class="form-group">
												<label>From:</label>
												<input type="text" class="form-control from-place" placeholder="Kuala Lumpur, Malaysia"/>
											 </div>
											</div>
											
											<div class="col-sm-6">
											  <div class="form-group">
												<label>To:</label>
												<input type="text" class="form-control to-place" placeholder="Singapore, Singapore"/>
											  </div>
											</div>
										  </div>
										  <!-- end destination -->
										  
										  <!-- start check in -->
										  <div class="form-row">										  
											<div class="col-sm-6">
											 <div class="form-group">
												<label>Check In:</label>
												<input type="text" class="form-control date-start" placeholder="mm/dd/yyyy"/>
											 </div>
											</div>
											
											<div class="col-sm-6">
											  <div class="form-group">
												<label>Check Out:</label>
												<input type="text" class="form-control date-end" placeholder="mm/dd/yyyy"/>
											  </div>
											</div>
										  </div>
										  <!-- end check in -->
										  
										  <!-- start class -->		
										  <div class="form-row">										  
											<div class="col-sm-12">
											 <div class="form-group">
												<label>Class:</label>
												<select class="form-control">
													<option value="economy" selected>Economy</option>
													<option value="first">First</option>
													<option value="business">Business</option>
												</select>
											 </div>
											</div>
										  </div>
										  <!-- end class -->
										  
										  <!-- start age -->		
										  <div class="form-row">										  
											<div class="col-sm-6">
											 <div class="form-group">
												<label>Adult:</label>
												<select class="form-control">
													<option value="1" selected>1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
												</select>
											 </div>
											</div>
											
											<div class="col-sm-6">
											 <div class="form-group">
												<label>Children:</label>
												<select class="form-control">
													<option value="1" selected>1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
												</select>
											 </div>
											</div>
										  </div>
										  <!-- end age -->
										  
										  <div class="form-row">										  
											<div class="col-sm-12">
												<input type="submit" class="btn btn-primary btn-block" value="Search Flight">
											</div>
										  </div>	
										  
										</form>
									 </div>
									 <!-- end tab trains -->
									 
									 <!-- start tab hotels -->	
									 <div class="tab-pane" id="hotels">
									 
										<form>
										  <!-- start city -->
										  <div class="form-row">										  
											<div class="col-sm-12">
											 <div class="form-group">
												<label>City:</label>
												<input type="text" class="form-control from-place" placeholder="Istanbul, Turkey"/>
											 </div>
											</div>
										  </div>
										  <!-- end city -->
										  
										  <!-- start check in -->
										  <div class="form-row">										  
											<div class="col-sm-6">
											 <div class="form-group">
												<label>Return:</label>
												<input type="text" class="form-control date-start" placeholder="mm/dd/yyyy"/>
											 </div>
											</div>
											
											<div class="col-sm-6">
											  <div class="form-group">
												<label>Check Out:</label>
												<input type="text" class="form-control date-end" placeholder="mm/dd/yyyy"/>
											  </div>
											</div>
										  </div>
										  <!-- end check in -->
										  
										  <!-- start rooms -->		
										  <div class="form-row">										  
											<div class="col-sm-12">
											 <div class="form-group">
												<label>Rooms:</label>
												<select class="form-control">
													<option value="economy">Economy</option>
													<option value="regular">Regular</option>
													<option value="vip" selected>VIP</option>
												</select>
											 </div>
											</div>
										  </div>
										  <!-- end class -->
										  
										  <!-- start age -->		
										  <div class="form-row">										  
											<div class="col-sm-6">
											 <div class="form-group">
												<label>Adult:</label>
												<select class="form-control">
													<option value="1" selected>1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
												</select>
											 </div>
											</div>
											
											<div class="col-sm-6">
											 <div class="form-group">
												<label>Children:</label>
												<select class="form-control">
													<option value="1" selected>1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
												</select>
											 </div>
											</div>
										  </div>
										  <!-- end age -->
										  
										  <div class="form-row">										  
											<div class="col-sm-12">
												<input type="submit" class="btn btn-primary btn-block" value="Search Hotel">
											</div>
										  </div>	
										  
										</form>
									 </div>
									 <!-- end tab hotel -->
									 
									 
									</div><!-- end tab content -->
								</div><!-- end tabulation -->
							</div>
<div class="seciton" id="map_div">
      
      <aside class = "aside" >
      <ul id = "sel_ul" >
      
      
      
      </ul>
      </aside>
      
      
      
      <div class="nav">
   
         <div id="list1" class="stored" style="overflow: scroll;">

            <ul id="ul_list"> 
            

            </ul>
         </div>
      </div>
      
   </div>

<!--------------------------------------------------- 모달 ----------------------------------------->

<!-- Modal -->
<div class="modal bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">여행 경로</h4>
        
      </div>
      <div class="modal-body">
        <form  action="mytripsend.jsp" name="mytripform"  method="POST" onsubmit="return checkValue()">
        <label style="">여행이름 </label><input type="button"  id="btn_mytriptitle" value="중복확인"class="btn btn-primary"><span class="double_result2" style="color: gray;"><h3></h3></span>
         <input type="text" name="myTripTitle" id="myTripTitle" class="myTripTitle" >
        
        <table style="border: 2px;" class="myTripTable" id="dynamicTable">
<thead>
<tr>

<th class="myTrip-th1">NO</th>
<th class="myTrip-th2">장소명</th>
<th class="myTrip-th3">도착(출발)시간</th>
<th class="myTrip-th4">거리</th>
<th class="myTrip-th5">시간(분)</th>

</tr>
</thead>
<tbody id="dynamicTbody">
    
</tbody>
</table>
 
      </div>
      <div class="modal-footer">
        <input type="submit" style="width: auto;height: 50px;"  value='Save' class ="btn btn-primary btn-lg">
        <button type="button" class="btn btn-primary btn-lg"  style="width:auto;height: 50px;" id="closeModalBtn" data-dismiss="modal">Close</button></br>
        <input type="hidden" id="id" name="id" value="<%=id%>">
       </form>
      </div>
      
    </div>
  </div>
</div>
<script>
var html;
var m_count=0;


$(document).ready(function(){
    $("#hotelcheck").change(function(){
        if($("#hotelcheck").is(":checked")){
           marker_hap();
           check ="food";
           reset_position(); 
           
           reset_map(); 
           make_list(check_list.length);
           addfood();
          
           
        }else{
           check ="hotel";
           marker_init(); 
            reset_position(); 
            reset_map(); 
            make_list(check_list.length);
            addfood();
            if($("#hotelcheck2").is(":checked")){
               
               marker_hap();
               check ="hotel";
               reset_position(); 
               
               reset_map(); 
               make_list(check_list.length);
               addfood();
              
               
            }}
    });
});
$(document).ready(function(){
    $("#hotelcheck2").change(function(){
        if($("#hotelcheck2").is(":checked")){
           
           marker_hap();
           check ="hotel";
           reset_position(); 
           
           reset_map(); 
           make_list(check_list.length);
           addfood();
           
           
        }else{
           check ="food";
           marker_init(); 
            reset_position(); 
            reset_map(); 
            make_list(check_list.length);
            addfood();
            if($("#hotelcheck").is(":checked")){
               marker_hap();
               check ="food";
               reset_position(); 
               
               reset_map(); 
               make_list(check_list.length);
               addfood();
               
               
            }   
        }
    });
});

var ttime=0;

//출발지
// 모달 버튼에 이벤트를 건다.
$('#asd').on('click', function(){
   
   
    if(mytrip.length !=0){
       if(m_count==0){
          
          
          for(key in mytrip){
        	  
        	 ttime += mytrip[key].viatime/60;
        	  
             html += '<tr>';
             html += '<td><input type="text" class ="qqq" name="myTripIndex" value="'+mytrip[key].index+'" readOnly></td>';
             html += '<td><input type="text" class ="qqq" name="myTripName" value="'+mytrip[key].name+'" readOnly></td>';
             html += '<td><input type="text" class ="qqq" name="myTripTime" value="'+mytrip[key].time.substring(4,6)+'월'+mytrip[key].time.substring(6,8)+'일'+mytrip[key].time.substring(8,10)+'시'+mytrip[key].time.substring(10,12)+'분" readOnly></td>';
             html += '<td><input type="text" class ="qqq" name="myTripDistance" value="'+mytrip[key].distance+'km" readOnly></td>';
             html += '<td><input type="text" class ="qqq" name="myTripViatime" id="myTripViatime" value="'+mytrip[key].viatime/60+'" readOnly></td>';
             html += '<td><input type="hidden"  name="myTripx" value="'+mytrip[key].x+'"></td>';
             html += '<td><input type="hidden"  name="myTripy" value="'+mytrip[key].y+'"></td>';
             html += '</tr>';
             
             }
          ttime += (mydt.time*1);
          html +='<tr>';
          html +='<td></td>';
          html +='<td><input type="text" name="TotalDistance" value="총거리 :'+mydt.distance+'km" readOnly></td>';
          html +='<td><input type="text" name="TotalTime" value="이동시간 :'+mydt.time+'분" readOnly></td>';
          html +='<td><input type="text"  value="총시간 :'+ttime+'분" readOnly></td>';
          html +='<td></td>';
          html +='</tr>';
         

      $("#dynamicTbody").empty();
      $("#dynamicTbody").append(html);
      $('#myModal').addClass("show");
      
      m_count++;
 
       }else{
          $('#myModal').addClass("show");
       }
       
    }else{
       alert("여행 경로를 정하고 눌러주세요");
       
       
    }
    
});
// 모달 안의 취소 버튼에 이벤트를 건다.
$('#closeModalBtn').on('click', function(){

	$('#myModal').removeClass('show');
//$('#myModal').modal('hide');


});


 

</script>

   <script>
   

   function show_where() 
   {   
      another(); 
      another2();
      lat = "<%=lat_str%>";
      lot = "<%=lot_str%>";
      lat1=parseFloat(lat);
      lot1 =parseFloat(lot);
      
      


      //psa
      <%for (int k = 0; k <= cl_li.size() - 1; k++) {%> 
      
    
      var add2 = "<%=cl_li.get(k).getAddr()%>"; 
      var name2 = "<%=cl_li.get(k).getTitle()%>"; 
      var lat2="<%=cl_li.get(k).getLat()%>";
      var lot2= "<%=cl_li.get(k).getLot()%>";
      var ph2 = "123456"; 
      var cat1= "";
      
      if("<%=cl_li.get(k).getImg()%>" == "사진없음" ){
         var src2 = "./images/defaultimg.jpg";
      }else{
         var src2 = "<%=cl_li.get(k).getImg()%>";
      }
         
            cl_list[
      <%=k%>
         ] = new Cl_obj(name2, lat2, lot2, ph2, src2, add2,cat1);
      
            <%}%>
            
            init_list=cl_list;    

             
            
      
      
      <%for (int i = cl_li.size() - 1; i >= 0; i--) {%>
         
      <%cl_li.remove(i);%>
         
      <%}%>
      
         }

      function another(){
         
         <%for (int k = 0; k <= hotel_li.size() - 1; k++) {%> 
         
            var name3 = "<%=hotel_li.get(k).getTitle()%>"; 
            var src3  = "<%=hotel_li.get(k).getImg()%>";
            var lat3="<%=hotel_li.get(k).getLat()%>";
            var lot3= "<%=hotel_li.get(k).getLot()%>";
            var ph3 = "<%=hotel_li.get(k).getTel()%>"; 
            var add3 = "<%=hotel_li.get(k).getAddr()%>"; 
             var cat1 = "B02";//음식

            

            hotel_list[<%=k%>] =new Cl_obj(name3, lat3, lot3, ph3, src3, add3,cat1) ;
            
               
                     
         <%}%>
         
      } 
function another2(){
         
         <%for (int k = 0; k <= food_li.size() - 1; k++) {%> 
         
            var name3 = "<%=food_li.get(k).getTitle()%>"; 
            var src3  = "<%=food_li.get(k).getImg()%>";
            var lat3="<%=food_li.get(k).getLat()%>";
            var lot3= "<%=food_li.get(k).getLot()%>";
            var ph3 = "<%=food_li.get(k).getTel()%>"; 
            var add3 = "<%=food_li.get(k).getAddr()%>"; 
             var cat1 = "A05"; //숙박

            

            food_list[<%=k%>] =new Cl_obj(name3, lat3, lot3, ph3, src3, add3,cat1) ;
          
               
                     
         <%}%>
         
      }
   </script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>