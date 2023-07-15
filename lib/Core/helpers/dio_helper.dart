import 'package:dio/dio.dart';

import '../utils/constance/const_api.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData({
    required String endPoint,
    String? token,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    final options = Options(headers: {'Authorization': ApiConstant.token});
    return await dio.post(endPoint,
        data: data, queryParameters: query, options: options);
  }

  static Future<Response> getData({
    required String endPoint,
    String? token,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    final options = Options(headers: {'Authorization': ApiConstant.token});
    return await dio.get(
      endPoint,
      data: data,
      queryParameters: query,
      options: options,
    );
  }
}
