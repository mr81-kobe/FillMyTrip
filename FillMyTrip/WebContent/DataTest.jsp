<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>


<%@ page import="tt.*"%>
<%@
 page import="java.util.*"%>
<%!
        Connection connection = null;
        Statement statement;
        ResultSet resultSet;
         int j=0;
        int i = 0;
        String city;
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://127.0.0.1:3305/db_main?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String uid = "root";
        String upw = "0307";
        String query ;
      String mm;
        String lat_str; 
        String lot_str;
        String tag[];
     	ArrayList<Cl> cl_li = new ArrayList<Cl>();
        String tag_[];
     	String PLACE_NAME ="";
        String LATITUDE = "";
        String LONGITUDE= "";
        String ADD = "";
        String SRC = ""; 
        String PH = "";
      	
        
        ArrayList<Number> timeList = new ArrayList<Number>();
        
        
        
        
        
        
        %>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>simpleMap</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx70571c96476747ee9c12c12216b1db95"></script>
<script type="text/javascript">
        var selinfo;    
        var len ; 
            var cl_list = [];
            var time_travel = 600;
            var lat1; 
            var lot1;
            var positions = [cl_list.length + 1];
           var map;
            var stop_by = 0;
            
            
            
            
            
            var cordinate ;
             var sel = new Array(cl_list.length);
            var bar_val = 0 ;	
			//cl_obj p s a
			function Cl_obj(name ,lat, lot,ph,src,add)  {
				
					this.name =name; 
					this.lat = lat;
					this.lot = lot;
					time = 0;
					this.ph = ph; 
					this.src = src; 
					this.add = add;
			}
           <%
        
      //??????????????? ????????? ???????????? ??????   
        request.setCharacterEncoding("utf-8"); //????????? ???????????? ?????????
        
      lat_str = request.getParameter("lat"); 
        lot_str = request.getParameter("lot");  
     
       
     String  tag = request.getParameter("tag");
       
       
	
        
          
         
         
       
	
//db query
        query = "select * from main_table where   MID = '"+ tag +"' ";

                try{
                    Class.forName(driver);
                    connection = DriverManager.getConnection(url, uid, upw);
                    statement = connection.createStatement();
                    resultSet = statement.executeQuery(query);
         
                    while(resultSet.next()){
                    	
                    		
                    	PLACE_NAME = resultSet.getString("PLACE_NAME");
                        LATITUDE = resultSet.getString("LATITUDE");
                        LONGITUDE= resultSet.getString("LONGITUDE");
                        ADD = resultSet.getString("NEW_ADDRESS");
                        SRC = resultSet.getString("IMG_SRC"); 
                       PH = resultSet.getString("PHONE_NUMBER");
                    	
                       cl_li.add(new Cl(LONGITUDE,LATITUDE,PLACE_NAME,PH,ADD,SRC));
                   		cl_li.get(i).value();
                    	System.out.println(i);
                    	
                    	i++;
                    }
                }catch(Exception e){
                    e.printStackTrace();
                }finally{ //?????? ?????? ??????
                    try{
                        if(resultSet != null) resultSet.close();
                        if(statement != null) statement.close();
                        if(connection != null) connection.close();
                    }catch(Exception e2){
                        e2.printStackTrace();
                    }
                }
           
            
                
                
                
                
                
              
                
                
                
                
                
                
                
                %>

             
      
       
 function bar(){
        	
        	document.getElementById('bar').value = bar_val +"";
        }
function set_max(){
        	
        	document.getElementById('bar').max = time_travel +"";
        }

        	 
        	 
        	 
         
             

                
                
                
                
                
for (var i = 0; i<10 ; i++) 
    
{
sel[i] = { 
	 title: 'me', 
	lonlat: new Tmapv2.LatLng(lat1,lot1),//?????? ??????
	time :121,
	src :"aa", 
	ph :"bb", 
	add : "cc"
	 };
        	

}

            
            
            function initTmap(){
               
        		
              
                
                 map = new Tmapv2.Map("map_div",  
				{
					center: new Tmapv2.LatLng(lat1,lot1), // ?????? ?????? ??????
					width: "890px", 
					height: "400px",
					zoom: 15
				});
             
            

              //?????? ?????? ?????? ??????
                	
                
         			for(var i = 0; i<positions.length; i++){
         				if(i!=0){
         				if(positions[i].time==0)
         				{
         					positions.splice(i,positions[i]);
         				}
         				
         				
         				
         				}
         				}
         			
        		
            	
                
        		for (var i = 0; i< positions.length; i++){//for?????? ????????? ?????? ?????? ?????? ?????? ?????? ??????
        			
        			var lonlat = positions[i].lonlat;
        			var title = positions[i].title;
        			var src = positions[i].src; 
        			var ph = positions[i].ph; 
        			var add = positions[i].add;
        			
        				var content = "<div style='position: static; display: flex; flex-direction: column; font-size: 14px; box-shadow: 5px 5px 5px #00000040; border-radius: 10px; top: 410px; left : 800px; width : 250px; background: #FFFFFF 0% 0% no-repeat padding-box;'>"+
		                "<div class='img-box' style='position: relative; width: 100%; height: 150px; border-radius: 10px 10px 0 0 ; background: #f5f5f5 url("+src+") no-repeat center;'>"+
		                "</div>"+
		                "<div class='info-box' style='padding: 10px;'>"+
		                "<p style='margin-bottom: 7px; overflow: hidden;'>"+
		                "<span class='tit' style=' font-size: 16px; font-weight: bold;'>"+title+"</span>"+
		                "<a href='http://tmapapi.sktelecom.com/' target='_blank' class='link' style='color: #3D6DCC; font-size: 13px; float: right;'>????????????</a>"+
		                "</p>"+
		                "<ul class='ul-info'>"+
		                "<li class='li-addr' style='padding-left: 20px; margin-bottom: 5px; background: url(resources/images/sample/ico-map.svg) no-repeat top 3px left;'>"+
		                "<p class='new-addr'>"+add+"</p>"+
		                
		                "</li>"+
		                "<li class='li-tell' style='padding-left: 20px; background: url(resources/images/sample/ico-tell.svg) no-repeat top 4px left;'>"+
		                "<span class='tell'>"+ph+"</span>"+
		                "</li>"+
		                "</ul>"+
		                "<ul class='btn-group' style='display: table; width: 100%; border-radius: 3px; height: 30px; border: 1px solid #EFEFEF; margin-top: 10px; text-align: center;'>"+
		                "<li style='display: table-cell; vertical-align: middle; width: 30%; height: 100%; border-right: 1px solid #EFEFEF;'>"+
		                "<a href='javascript:void(0)' onclick='onInsert()' title='????????????'><img src='https://ifh.cc/g/JOdnoD.png' width='50' height='100'></a>"+
		                "</li>"+
		                "<li style='display: table-cell; vertical-align: middle; width: 30%; height: 100%; border-right: 1px solid #EFEFEF;''>"+
		                "<a href='javascript:void(0)' onclick='onPrint()' title='????????????'><img src='https://ifh.cc/g/JOdnoD.png' width='50' height='100'>asd</a>"+
		                "</li>"+
		                "</ul>"+
		                "</div>"+
		                "<a href='javascript:void(0)' onclick='onClose()' class='btn-close' style='position: absolute; top: 10px; right: 10px; display: block; width: 15px; height: 15px; background: url(https://ifh.cc/g/9azmvk.png) no-repeat center;'></a>"+
		                "</div>";
		                var ma;
		                if(positions[i].title== "me"){
		               ma = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png"
		                } 
		                else{
		                	 ma =" http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_1.png";
		                }
		                //Marker ?????? ??????.
        			marker = new Tmapv2.Marker({
        				position : lonlat, //Marker??? ???????????? ??????.
        				map : map, //Marker??? ????????? Map ??????.
        				title : title, //Marker ?????????.
        				icon :ma ,
        				animation:null, //Marker ???????????????.
        	            animationLength: 500 //??????????????? ??????.
		             });
        		
        			
        		
        				
		             addListener(marker,lonlat,content,title);
		             
        			
                
            
        		}
            
          
        		
        		
            
 		           
        		function addListener(marker,lonlat,content){
			         
			         
			         marker.addListener("click", function(evt) {
			         //Popup ?????? ??????.
			                    infoWindow = new Tmapv2.InfoWindow({
			               position: lonlat, //Popup ??? ????????? ??? ??????
			               content: content , //Popup ????????? text
			               type: 2, //Popup??? type ??????.
			               map: map, //Popup??? ????????? ??? ??????
			               title : title
			               });
			                    
			         
			         });
			         };	
        		

            
            
            
            
            }
			         
           
			         
			         
           
            
            
            
            
            
            
            function onClose(){
	             infoWindow.setVisible(false);
	          }
	         
	         
	         function onInsert (){
	        	
	        	 for (var i = 1; i<positions.length; i++){
	        		 
	        		if(infoWindow.getPosition() === positions[i].lonlat) {
	        			 
	        			 sel[stop_by]=positions[i];
	        			 
	        		  bar_val =bar_val+sel[stop_by].time;
	        		
	        		 if(bar_val<=time_travel)
	        			{
	        			 
	        			 bar(bar_val);
	        			for(var j =0; j<cl_list.length; j++){
	        			 if(sel[stop_by].title==cl_list[j].name){
	        				 get_time(cl_list[j].lot , cl_list[j].lat);
									        			
	        			 }
	        			 
	        			 
	        			
	        			}
	        			  reset_position();
	        			  stop_by++;
	        			alert(stop_by);
	        			
	        			infoWindow.setVisible(false);
	        			
		        			
		        			
	        			
	        			} 
	        		 else {
	        			 
	        			 alert("??????????????? ?????????????????????.");		
	        			 bar_val-=sel[i].time;
	 	        		bar(bar_val);
	 	        		infoWindow.setVisible(false);
	 	        		 }
	        		
	        		 
	        		
	        		 
	        	 /*  for(var j =1; j<sel.length;){
	        		  
	        		  for(var i =0; i<cl_list.length; i++)
	        		  {
	        			  
	        			  if(sel[j].title==cl_list[i].title){
	        				  if(sel[j].title== "me"){
	        				   selinfo=[[lot,lat],[cl_list[i].lot,cl_list[i].lat]];
	        				  sel.splice(j,1);
	        				  draw_line(selinfo); 
	        				  
	        				  }
	        				  else{
	        					  for(var a=0; a<cl_list.length; a++;)
	        					  {
	        					  		if(sel[j+1].title == cl_list[a].title){
	        						   selinfo=[[cl_list[i].lot,cl_list[i].lat],[cl_list[a].lot,cl_list[a].lat]];
	        					  		}
	        					  		}
	        					  draw_line(selinfo);  
	        				  }
	        			  }
	        		  }
	        	  }
	        	 */ 
	        			}
	        		 
	        	 }
	        	 
	        	 
	         }
			
					
	         

	 		function get_course(aa) {

	 			//?????? ?????? ?????? ????????? ?????????
	 			reset_map();

	 			

	 			//JSON TYPE EDIT [S]
	 			$
	 					.ajax({
	 						type : "POST",
	 						url : "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result",
	 						async : false,
	 						data : {
	 							"appKey" : "l7xx70571c96476747ee9c12c12216b1db95",
	 							"startX" : lot,
	 							"startY" : lat,
	 							"endX" :"126.776980" ,
	 							"endY" : "37.683632",
	 							"passList" : aa,
	 							"reqCoordType" : "WGS84GEO",
	 							"resCoordType" : "EPSG3857",
	 							"searchOption" : "0",
	 							"trafficInfo" : "Y"
	 						},
	 						success : function(response) {

	 							var resultData = response.features;

	 							var tDistance = "??? ?????? : "
	 									+ (resultData[0].properties.totalDistance / 1000)
	 											.toFixed(1) + "km,";
	 							var tTime = " ??? ?????? : "
	 									+ (resultData[0].properties.totalTime / 60)
	 											.toFixed(0) + "???,";
	 							var tFare = " ??? ?????? : "
	 									+ resultData[0].properties.totalFare
	 									+ "???,";
	 							var taxiFare = " ?????? ?????? ?????? : "
	 									+ resultData[0].properties.taxiFare
	 									+ "???";

	 							
	 							
	 							//???????????? ?????? ???????????? ??????
	 							//if (trafficInfochk == "Y") {
	 								for ( var i in resultData) { //for??? [S]
	 									var geometry = resultData[i].geometry;
	 									var properties = resultData[i].properties;

	 									if (geometry.type == "LineString") {
	 										//?????? ????????? ??????
	 										chktraffic
	 												.push(geometry.traffic);
	 										var sectionInfos = [];
	 										var trafficArr = geometry.traffic;

	 										for ( var j in geometry.coordinates) {
	 											// ???????????? ??????????????? ????????? ????????? ??????  
	 											
	 											var latlng = new Tmapv2.Point(
	 													geometry.coordinates[j][0],
	 													geometry.coordinates[j][1]);
	 											// ????????? ????????? ?????? ??????????????? ??????
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

	 										if (properties.pointType == "S") { //????????? ??????
	 											markerImg = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
	 											pType = "S";
	 										} 

	 										// ???????????? ??????????????? ????????? ????????? ?????? 
	 										var latlon = new Tmapv2.Point(
	 												geometry.coordinates[0],
	 												geometry.coordinates[1]);
	 										// ????????? ????????? ?????? ??????????????? ?????? ??????
	 										var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
	 												latlon);

	 										var routeInfoObj = {
	 											markerImage : markerImg,
	 											lng : convertPoint._lng,
	 											lat : convertPoint._lat,
	 											pointType : pType
	 										};
	 										// ?????? ??????
	 										
	 									}
	 								}//for??? [E]
	 //????????????
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
	 		}


	 function addComma(num) {
	 var regexp = /\B(?=(\d{3})+(?!\d))/g;
	 return num.toString().replace(regexp, ',');
	 } 
	 function get_pass(){
	 for(var i=1+az; i<4+az;i++)
	 	{
	 	
	 	for(var j=0; j<cl_list.length;j++)
	 	{
	 		if(positions_ran[i].title==cl_list[j].name)
	 		{
	 			ay.push([cl_list[j].lot,cl_list[j].lat]); 
	 			
	 			
	 		}                		
	 	
	 	}
	 	
	 	}
	 az=az+2;

	 }
	 //?????? ????????????
	 function addMarkers(infoObj) {
	 var size = new Tmapv2.Size(24, 38);//????????? ?????? ???????????????.

	 if (infoObj.pointType == "P") { //????????????????????? ????????? ????????? ????????????.
	 size = new Tmapv2.Size(8, 8);
	 }

	 marker_p = new Tmapv2.Marker({
	 position : new Tmapv2.LatLng(infoObj.lat, infoObj.lng),
	 icon : infoObj.markerImage,
	 iconSize : size,
	 map : map
	 });


	 }

	 //???????????????
	 function drawLine(arrPoint, traffic) {
	 var polyline_;

	 if (chktraffic.length != 0) {

	 // ???????????? ???????????? ??????
	 // strokeColor??? ?????? ??????????????? ????????? ??????
	 // traffic :  0-????????????, 1-??????, 2-??????, 3-??????, 4-??????  (black, green, yellow, orange, red)

	 var lineColor = "";

	 if (traffic != "0") {
	 	
	 if (traffic.length == 0) { //length??? 0????????? ??????????????? ???????????? ??????????????? ??????
	 	
	 	lineColor = "#06050D";
	 	//???????????????[S]
	 	polyline_ = new Tmapv2.Polyline({
	 		path : arrPoint,
	 		strokeColor : lineColor,
	 		strokeWeight : 6,
	 		map : map
	 	});
	 	resultdrawArr.push(polyline_);
	 	//???????????????[E]
	 } else { //??????????????? ??????
	 	
	 	if (traffic[0][0] != 0) { //???????????? ?????????????????? 0??? ????????????
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

	 		//???????????????[S]
	 		polyline_ = new Tmapv2.Polyline({
	 			path : noInfomationPoint,
	 			strokeColor : "#06050D",
	 			strokeWeight : 6,
	 			map : map
	 		});
	 		//???????????????[E]
	 		resultdrawArr.push(polyline_);

	 		for (var x = 0; x < tInfo.length; x++) {
	 			var sectionPoint = []; //????????????
	 			
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

	 			//???????????????[S]
	 			polyline_ = new Tmapv2.Polyline({
	 				path : sectionPoint,
	 				strokeColor : lineColor,
	 				strokeWeight : 6,
	 				map : map
	 			});
	 			//???????????????[E]
	 			resultdrawArr.push(polyline_);
	 		}
	 	} else { //0?????? ???????????? ??????
	 	
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
	 			var sectionPoint = []; //????????????

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

	 			//???????????????[S]
	 			polyline_ = new Tmapv2.Polyline({
	 				path : sectionPoint,
	 				strokeColor : lineColor,
	 				strokeWeight : 6,
	 				map : map
	 			});
	 			//???????????????[E]
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
	         
	         
	         function get_time(a,b) {

						//?????? ?????? ?????? ????????? ?????????
						for(var j= 0; j<cl_list.length; j++)
					{		
							
													
							 
						
							 
							 
							 //JSON TYPE EDIT [S]
						$
								.ajax({
									type : "POST",
									url : "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result",
									async : false,
									data : {
										"appKey" : "l7xx70571c96476747ee9c12c12216b1db95",
										"startX" : a,
										"startY" : b,
										"endX" : cl_list[j].lot,
										"endY" : cl_list[j].lat,
										"reqCoordType" : "WGS84GEO",
										"resCoordType" : "EPSG3857"
											
									},
									success : function(response) {
										
										var resultData = response.features;

										var tDistance = "??? ?????? : "
												+ (resultData[0].properties.totalDistance / 1000)
														.toFixed(1) + "km,";
										 tTime = " ??? ?????? : "
												+ (resultData[0].properties.totalTime / 60)
														.toFixed(0) + "???,";
										var tFare = " ??? ?????? : "
												+ resultData[0].properties.totalFare
												+ "???,";
										var taxiFare = " ?????? ?????? ?????? : "
												+ resultData[0].properties.taxiFare
												+ "???";

										$("#result").text(
												tDistance + tTime + tFare
														+ taxiFare);
										
										//???????????? ?????? ???????????? ??????
									var until	=((resultData[0].properties.totalTime / 60).toFixed(0))*1;
										
										cl_list[j].time= until;
										
									
										
										
										
										
										
										
										
										
										
										
										
										
										
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
					
					}

					   
        	
				
			function sort(){
				
				cl_list.sort(function(a, b) { // ????????????
				    return a.time < b.time ? -1 : a.time > b.time ? 1 : 0;
				    // ??????, ??????, ??????, ??????
				});
				
			}
				
					
				
					function get_course( )
					{
						var headers = {}; 
						headers["appKey"]="l7xx70571c96476747ee9c12c12216b1db95";
						
						$.ajax({
							type:"POST",
							headers : headers,
							url:"https://apis.openapi.sk.com/tmap/routes/routeOptimization30?version=1&format=json",//
							async:false,
							contentType: "application/json",
							data: JSON.stringify({
									  "reqCoordType": "WGS84GEO",
									  "resCoordType" : "EPSG3857",
									  "startName": "??????",
									  "startX": lot,
									  "startY": lat,
									  "startTime": "202006152124",
									  "endName": "??????",
									  "endX": "127.00973587385866",
									  "endY": "37.56445848334345",
									  "searchOption" : "0",
									  "viaPoints": [
									    {
									      "viaPointId": "test01",
									      "viaPointName": "test01",
									      "viaX": "126.98735015742581",
									      "viaY": "37.56626352138058",
									    },
									    {
									      "viaPointId": "test02",
									      "viaPointName": "test02",
									      "viaX": "127.00221495976581",
									      "viaY": "37.56568310756034",
									    },
									    {
									      "viaPointId": "test03",
									      "viaPointName": "test03",
									      "viaX": "126.992153",
									      "viaY": "37.570369",
									    },
									    {
									      "viaPointId": "test04",
									      "viaPointName": "test04",
									      "viaX": "127.00352387777271",
									      "viaY": "37.56335290252303",
									    },
									    {
									      "viaPointId": "test05",
									      "viaPointName": "test05",
									      "viaX": "127.00186090818215",
									      "viaY": "37.570721714117965",
									    },
									    {
									      "viaPointId": "test06",
									      "viaPointName": "test06",
									      "viaX": "126.99066536776698", 
									      "viaY": "37.56515390827723",
									    }
									  ]
							}),
							success:function(response){
								var resultData = response.properties;
								var resultFeatures = response.features;
								
								// ?????? ??????
								var tDistance = "??? ?????? : " + resultData.totalDistance + "km,  ";
								var tTime = "??? ?????? : " + resultData.totalTime + "???,  ";
								var tFare = "??? ?????? : " + resultData.totalFare + "???";
								
								$("#result").text(tDistance+tTime+tFare);
								
								for(var i in resultFeatures) {
									var geometry = resultFeatures[i].geometry;
									var properties = resultFeatures[i].properties;
									var polyline_;
									
									drawInfoArr = [];
									
									if(geometry.type == "LineString") {
										for(var j in geometry.coordinates){
											// ???????????? ?????????(??????)?????? ????????? ????????? ?????? 
											var latlng = new Tmapv2.Point(geometry.coordinates[j][0], geometry.coordinates[j][1]);
											// ????????? ????????? ?????? ??????????????? ??????
											var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlng);
											// ?????????????????? ????????? ????????? ?????? ????????? ??????
											var convertChange = new Tmapv2.LatLng(convertPoint._lat, convertPoint._lng);
											
											drawInfoArr.push(convertChange);
										}

										polyline_ = new Tmapv2.Polyline({
											path : drawInfoArr,
											strokeColor : "#FF0000",
											strokeWeight: 6,
											map : map
										});
									}
								}
							},
							error:function(request,status,error){
								console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
						});
					}
        	
					
					
        	</script>



</head>
<body
	onload="set_max(); show_where();   reset_position();  initTmap();  make_maker(); ">
	<div id="map_div"></div>










	<script>


function show_where() 
{	
	
	lat = "<%=lat_str%>";
	lot = "<%=lot_str%>";
	lat1=parseFloat(lat);
	lot1 =parseFloat(lot);
	city = "<%=city%>";
	


	//psa
	<%	for(int k =0; k<=cl_li.size()-1; k++) {%> 
	
	
	var name2 = "<%=cl_li.get(k).getName()%>"; 
	var lat2="<%=cl_li.get(k).getLa()%>";
	var lot2= "<%=cl_li.get(k).getLo()%>";
	var ph2 = "<%=cl_li.get(k).getPh()%>"; 
	var add2 = "<%=cl_li.get(k).getAdd()%>"; 
	var src2 = "<%=cl_li.get(k).getSrc()%>";
	cl_list[<%=k%>]= new Cl_obj(name2,lat2,lot2 ,ph2,src2,add2);
	
	
	<% } %>

	
	
	}

function reset_position(){
	
	
	
	
	for(var i=0; i<cl_list.length+1;i++){
        
    	
    	positions[i]=	{
    		title: 'me', 
    		lonlat: new Tmapv2.LatLng(lat1,lot1),//?????? ??????
    		time :0,
    		src :"aa", 
    		ph :"bb", 
    		add : "cc"
    };  

    }
	
	
	
	
	
	
	for(var i=1; i<positions.length;i++){
		
       
		
		positions[i]=	{
 				title: cl_list[i-1].name, 
 				lonlat: new Tmapv2.LatLng(cl_list[i-1].lat,cl_list[i-1].lot),//?????? ??????
 				time: cl_list[i-1].time, 
 				src : cl_list[i-1].src, 
 				ph : cl_list[i-1].ph, 
 				add : cl_list[i-1].add,
 				
 				
		
		};  
		
		
		}

alert(positions[2].time);
}


</script>
	<progress id="bar" value="0" max="120"> 32% </progress>
	<input type="button" value="get_time" onclick="get_length()">



</body>
</html>
