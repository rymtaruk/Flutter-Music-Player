import 'package:dio/dio.dart';

class Network {
  final _dio = Dio();

  Network() {
    _dio.interceptors.clear();

    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler){
      return handler.next(options);
    }, onResponse: (response, handler) async {
      return handler.next(response);
    }, onError: (error, handler) async {
      return handler.next(error);
    }));

    _dio.options = BaseOptions(
      baseUrl: "https://itunes.apple.com",
      connectTimeout: 30000,
      receiveTimeout: 30000
    );
  }

  Future<Response?> getNetwork(String url,
      {Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        int cacheDays = 7,
        bool forceRefresh = true}) async {
    Response? response;
    try {
      response = await _dio.get(url,
          queryParameters: queryParameters);
    } on DioError catch (e) {
      return e.response;
    }
    return response;
  }
}
