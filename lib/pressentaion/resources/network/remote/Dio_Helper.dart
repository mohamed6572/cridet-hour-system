import 'package:dio/dio.dart';

class Dio_Helper{
  static late Dio dio;

  static init(){
    dio =Dio(
      BaseOptions(
        baseUrl: 'https://toppng.com/api/v1/',
        receiveDataWhenStatusError: true,

      )
    );
  }

 static Future<Response> getData(
      {
        required String url,
        Map<String, dynamic>? query,
      })async{
    return await dio.get(url,queryParameters: query, );
  }

  static Future<Response> postData(
      {


        required String url,
         String? deviceType,
        Map<String, dynamic>? data,
         String? token,
        var onReceiveProgress
      })async
  {
    dio.options.headers = {

      'mobile-token':token??'',
      'device-type':deviceType??'',
    };
    return  dio.post(
      url,
       data: data,
      onReceiveProgress: onReceiveProgress
    );
  }
  static Future<Response> putData(
      {
        required String url,
         String lang= 'en',
         String? token,
         Map<String, dynamic>? query,
        required Map<String, dynamic> data,
      })async
  {
    dio.options.headers = {
      'lang':lang,
      'Authorization':token??'',
      'Content-Type':'application/json',
    };
    return  dio.put(
      url,
      queryParameters: query,
      data: data
    );
  }
}
