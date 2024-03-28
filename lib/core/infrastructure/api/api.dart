import 'package:dio/dio.dart';


abstract class Api {

  get(String baseUrl,{Object? data,Map<String, dynamic>? queryParameters ,Map<String, dynamic>? headers});

  post(String baseUrl,{Object? data,Map<String, dynamic>? queryParameters ,Map<String, dynamic>? headers});

  put(String baseUrl,{Object? data,Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers});

  delete(String baseUrl,{Object? data,Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers});

}

class ApiImpl implements Api {

  final Dio client = Dio();

  @override
  Future<Response> delete(String baseUrl,{Object? data,Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers}) async {
    return await client.delete(
      baseUrl,
      options: Options(
          headers: headers,
          receiveDataWhenStatusError: true,
          followRedirects: false,
          validateStatus: (status)=> true,
          receiveTimeout: const Duration(seconds: 60)
      ),
      data: data,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<Response> get(String baseUrl,{Object? data,Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers}) async {
    return await client.get(
      baseUrl,
      options: Options(
          headers: headers,
          receiveDataWhenStatusError: true,
          followRedirects: false,
          validateStatus: (status)=> true,
          receiveTimeout: const Duration(seconds: 60)
      ),
      data: data,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<Response> post(String baseUrl,{Object? data,Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers}) async {
    return await client.post(
      baseUrl,
      options: Options(
          headers: headers,
          receiveDataWhenStatusError: true,
          followRedirects: false,
          validateStatus: (status)=> true,
          receiveTimeout: const Duration(seconds: 60)
      ),
      data: data,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<Response> put(String baseUrl,{Object? data,Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers}) async {
    return await client.put(
      baseUrl,
      options: Options(
          headers: headers,
          receiveDataWhenStatusError: true,
          followRedirects: false,
          validateStatus: (status)=> true,
          receiveTimeout: const Duration(seconds: 60)
      ),
      data: data,
      queryParameters: queryParameters,
    );
  }

}