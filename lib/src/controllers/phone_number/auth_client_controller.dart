
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'auth_controller.dart';

class DioAuthClient {
  final Dio _dio = Dio();
  final _baseUrl = 'http://localhost:9999';
  AuthController authController = Get.find();
  String? tokenId = GetStorage().read('tokenId');

  DioAuthClient() {
    _dio.interceptors.add(TokenInterceptor());
  }

  /*
  Future<bool> login() async {
    authController.storeToken();
    tokenId = GetStorage().read('tokenId');
    try {
      Response response = await _dio.post('$_baseUrl/auth/astroLogin',
          data: jsonEncode({
            "firebaseId": tokenId,
          }));
      if(response.statusCode == 200) {
        GetStorage().write('authToken', response.data["data"]);
        return true;
      }
    } on DioError catch (e) {
      if (e.response?.data["error"] == "User does not exists!") {
        print("ayee");
        return false;
      } else {
        print(e.message);
        return false;
      }
    }
    return false;
  }

  Future<bool> signup(Profile profile) async {
    var data = profile.toJson();
    authController.storeToken();
    tokenId = GetStorage().read('tokenId');
    data["firebaseId"] = tokenId;
    try {
      Response response = await _dio.post(
        '$_baseUrl/auth/astroSignup',
        data: data,
      );
      print(response);
      GetStorage().write('authToken', response.data["data"]);
    } on DioError catch (e) {
      if (e.response?.data["error"] == "User does not exists!") {
        return false;
      } else {
        print(e.message);
      }
    }
    return true;
  }

  Future<bool> update(Profile profile) async {
    var data = profile.toJson();
    authController.storeToken();
    String? authToken = GetStorage().read('authToken');
    try {
      Response response = await _dio.post(
        '$_baseUrl/astro/updateProfile',
        data: data,
        options: Options(
          headers: {
            "authorization" : "Bearer $authToken"
          }
        )
      );
    } on DioError catch (e) {
      if (e.response?.data["error"] == "User does not exists!") {
        return false;
      } else {
        print(e.message);
      }
    }
    return true;
  }*/
  Dio get dio => _dio;
}

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(
        'HEADERS[${options.headers}] => DATA: ${options.data}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}'
            'DATA: ${response.data}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    print(err.response?.data);
    return super.onError(err, handler);
  }
}