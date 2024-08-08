import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Naver-Client-Id'] = 'ECRybq2v3NnGHfD5V6eA';
    options.headers['X-Naver-Client-Secret'] = 'tzTFeoVKYJ';
    super.onRequest(options, handler);
  }
}
