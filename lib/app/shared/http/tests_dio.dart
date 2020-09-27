import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interceptors/auth_interceptor.dart';

part 'tests_dio.g.dart';

@Injectable()
class TestsDio extends DioForNative {
  TestsDio([BaseOptions options]) : super(options) {
    interceptors.add(AuthInterceptor());
  }
}