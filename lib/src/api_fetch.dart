
import 'package:dio/dio.dart';
 class Api {
   late Response response;
  Dio dio = Dio();

  bool error = false; 
  bool loading = false;
  String errmsg = ""; 
  var apidata; 
  getsearch() async
  {
    String url = "https://talk-gpt-server.onrender.com"; 
    response = await dio.post(url, data: {'prompt': 'What is abc'});
      
       
       if(response.statusCode == 200){
          //fetch successful
          if(response.data["bot"] ==  ""){ 
              error = true; 
              return "Couldnt fetch data";
          }
          return response.data["bot"];
      }else{ 
          error = true;
          errmsg = "Error while fetching data.";
          return errmsg;
      }
  }
 }