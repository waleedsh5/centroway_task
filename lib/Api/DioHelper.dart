import 'package:dio/dio.dart';


Dio DioHelper() {

  Dio dio = Dio();
  dio.options.connectTimeout = 10000;
  dio.options.baseUrl = 'https://raw.githubusercontent.com/';

  dio.interceptors.add(dioLoggerInterceptor);
  return dio;
}

final dioLoggerInterceptor =
    InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
  print(
      "┌------------------------------------------------------------------------------");
  print('| [DIO] Request: ${options.method} ${options.uri}');
  print('| ${options.data.toString()}');
  print('| Headers:');
  options.headers.forEach((key, value) {
    print('|\t$key: $value');
  });
  print(
      "├------------------------------------------------------------------------------");
  handler.next(options); //continue
}, onResponse: (dynamic response, handler) async {
  print(
      "| [DIO] Response [code ${response.statusCode}]: ${response.data.toString()}");
  print(
      "└------------------------------------------------------------------------------");
  handler.next(response);
  // return response; // continue
}, onError: (DioError error, handler) async {
  print("| [DIO] Error: ${error.error}: ${error.response.toString()}");
  print(
      "└------------------------------------------------------------------------------");
  handler.next(error); //continue
});
