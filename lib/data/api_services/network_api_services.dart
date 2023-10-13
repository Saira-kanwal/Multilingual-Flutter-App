import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../api_services/base_api_services.dart';
import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices{

//GET API
  @override
  Future getApi(String url) async{

    if(kDebugMode){
      print(url);
    }

    dynamic responseJson;
   try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
   } on SocketException{
     throw InternetException('');
   } on RequestTimeOut {
     throw RequestTimeOut();
   } on InvalidUrlException {
     throw InvalidUrlException();
   }

    print(responseJson);
    return responseJson;
  }



//POST API
  @override
  Future postApi(var data, String url) async {
    if(kDebugMode){
      print(url);
    }

    dynamic responseJson;
    try{
      final response = await
      http.post(
          Uri.parse(url),
          body: jsonEncode(data)
      ).timeout(const Duration(seconds: 10));
      //If Data is in raw form use jsonEncode otherwise simply use data
      responseJson =returnResponse(response);
    } on SocketException{
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut();
    }  on InvalidUrlException {
      throw InvalidUrlException();
    }

    print(responseJson);
    return responseJson;
  }



//Exceptions
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrlException();
    //ToDo: More status codes can be used... if needed
      default :
        throw FetchDataException('This Error occurred while communicating with Server ${response.statusCode.toString()}');
    }


  }

  }
