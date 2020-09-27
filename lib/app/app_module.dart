import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'app_controller.dart';

import 'package:tests_app/app/app_widget.dart';
import 'package:tests_app/app/modules/home/home_module.dart';
import 'package:tests_app/app/modules/login/login_module.dart';

import 'package:tests_app/app/shared/components/loading.dart';
import 'package:tests_app/app/shared/repositories/user_repository.dart';
import 'package:tests_app/app/shared/services/user_service.dart';
import 'package:tests_app/app/shared/stores/user_store.dart';


import 'shared/http/tests_dio.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    $AppController,
    $UserStore,
    $UserService,
    $UserRepository,
    $Loading,
    $TestsDio,
    Bind(
      (i) => BaseOptions(
        baseUrl: 'https://fake-api-helper.herokuapp.com',
        connectTimeout: 5000,
      ),
    ),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, module: HomeModule()),
    ModularRouter('/login', module: LoginModule())
  ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
