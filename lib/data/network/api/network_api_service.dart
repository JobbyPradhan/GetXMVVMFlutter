import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:getx_mvvm/data/app_exception.dart';
import 'package:getx_mvvm/data/network/api/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService{
  @override
  Future getApi(String url) async{
    dynamic jsonResponse;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    }on SocketException{
      throw InternetException();
    }on TimeoutException{
      throw RequestTimeOutException();
    }

    return jsonResponse;
  }

  dynamic returnResponse(http.Response response){
     switch(response.statusCode){
       case 200 :
         dynamic responseJson = jsonDecode(response.body);
         return responseJson;
       case 400 :
         throw InvalidUrlException();
       default :
         throw FetchDataException(response.statusCode.toString());
     }
  }

  @override
  Future postApi(var data, String url) async{
    if(kDebugMode){
      print(url);
      print(data);
    }
    dynamic jsonResponse;
    try{
      final response = await http.post(Uri.parse(url),
        body: jsonEncode(data)
      ).timeout(const Duration(seconds: 20));
      jsonResponse = returnResponse(response);
    }on SocketException{
      throw InternetException();
    }on TimeoutException{
      throw RequestTimeOutException();
    }

    return jsonResponse;
  }

}