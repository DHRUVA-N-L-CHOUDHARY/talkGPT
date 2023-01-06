import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:get_storage/get_storage.dart';

class DioClient {
  final Dio _dio = Dio();
  final _baseUrl = 'https://astrobackend0.herokuapp.com';

  DioClient() {
    _dio.interceptors
      ..add(TokenInterceptor())
      ..add(DioCacheInterceptor(options: options));
  }

  Dio get dio => _dio;
}

class TokenInterceptor extends Interceptor {
  String? authToken = GetStorage().read('authToken');
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["authorization"] = "Bearer $authToken";
    print(options.headers);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}'
        'DATA => ${response.data}');
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

// Global options
final options = CacheOptions(
  store: MemCacheStore(),
  policy: CachePolicy.request,
  hitCacheOnErrorExcept: [401, 403],
  maxStale: const Duration(hours: 1),
  priority: CachePriority.high,
);