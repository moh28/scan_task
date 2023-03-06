import 'dart:async';
import 'package:dio/dio.dart';
import 'cache_helper.dart';
class ServerGate{
  static  Dio? dio;
  static init(){
    dio =Dio(
      BaseOptions(
        baseUrl: 'https://fourthpyramidagcy.net/company/api/v1/',
        headers:{
      'Authorization': 'Bearer ${CacheHelper.getUserToken()}',
          "Accept": "application/json",
          "Accept-Language": 'en',
        } ,
        receiveDataWhenStatusError: true,

      ),
    );
  }
  static Future<Response> getData ({
    required String url,
    Map<String, dynamic>? query,
    String? token})
  async{
    return await  dio!.get(url, queryParameters: query);
  }
  static Future<Response> postData(
      {
        required String? url,
        required Map<String,dynamic>? data,
        String? token
      }
      )async
  {

    //print("data "+data.toString());
    return await dio!.post(
        url!,
        data: data,

    );
  }
}