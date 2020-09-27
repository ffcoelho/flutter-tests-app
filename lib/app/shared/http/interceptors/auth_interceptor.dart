import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../services/interfaces/user_service_interface.dart';

class AuthInterceptor extends InterceptorsWrapper {

  @override
  Future onRequest(RequestOptions options) async {
    var userService = Modular.get<IUserService>();
    var user = await userService.getCurrentUser();

    debugPrint('AuthInterceptor.onRequest() - user: $user');

    if (user?.token != null && user.token.isNotEmpty) {
      var headerAuth = genToken(user.token);
      options.headers['Authorization'] = headerAuth;
    }
    if (kDebugMode) {
      debugPrint(json.encode('BaseURL: ${options.baseUrl}'));
      debugPrint(json.encode('Endpoint: ${options.path}'));
      if (options.headers['Authorization'] != null) {
        debugPrint('Authorization: ${options.headers['Authorization']}');
      }
      if (options.data != null) {
        debugPrint('Payload ${json.encode(options.data)}');
      }
    }

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) async {
    if (kDebugMode) {
      var dio = Modular.get<DioForNative>();
      var options = err.response.request;
      debugPrint('dio error - aqui');
      debugPrint(err.response.toString());
      //return dio.request(options.path, options: options);
    } else {
      throw err;
    }
  }

  String genToken(String token) {
    return 'Bearer $token';
  }
}