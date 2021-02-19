import 'package:bloc_injection_dep/src/shared/constants.dart';
import 'package:dio/dio.dart';

class ClientHttp {
  Dio dio = Dio();
  ClientHttp() {
    dio.options.baseUrl = URL_API;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          //options.headers["Authentication"] = "bearer aksjdkasd";
          return options;
        },
      ),
    );
  }
  Dio getClient() => dio;
}
