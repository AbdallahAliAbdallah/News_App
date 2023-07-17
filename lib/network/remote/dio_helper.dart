

import 'package:dio/dio.dart';

import '../../shared/constant.dart';

class DioHelper{
  static Dio? dio;

  static init(){
    dio=Dio(BaseOptions(baseUrl:baseUrl,receiveDataWhenStatusError: true ));
  }
static Future getData({required String path,required Map<String,dynamic> query})async{
    return await dio!.get(path,queryParameters:query );
}
}