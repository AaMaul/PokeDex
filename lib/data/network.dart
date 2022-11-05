import 'package:api_pokemon/conts/app_constant.dart';
import 'package:dio/dio.dart';

class NetworkCore {
  Dio dio = Dio();


  NetworkCore() {
    dio.options = BaseOptions(
        baseUrl: AppConstant.baseUrl,
        connectTimeout: 40000,
        receiveTimeout: 40000,
        sendTimeout:40000,
        headers: {
          "Accept" : "application/json"
        }
    );
  }
}