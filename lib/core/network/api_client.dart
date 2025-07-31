import 'package:dio/dio.dart';

class MySingleton {
  // Private static instance
  static final MySingleton _instance = MySingleton._internal();

  // Public getter
  static MySingleton get instance => _instance;

  factory MySingleton()=>_instance;

  // Dio instance
  late final Dio dio;

  // Private constructor
  MySingleton._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: '',
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          //'x-api-key': 'reqres-free-v1',
          // 'Authorization': 'Bearer your_token', // add if needed
        },
      ),
    );

    // Add interceptors
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Logging request
        print('🚀 Request: ${options.method} ${options.uri}');
        print('Headers: ${options.headers}');
        print('Data: ${options.data}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Logging response
        print('✅ Response [${response.statusCode}]: ${response.data}');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        // Logging errors
        print('❌ Error: ${e.response?.statusCode} ${e.message}');
        return handler.next(e);
      },
    ));
  }
}

