import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_page.dart';
import 'logged_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
    $LoginController,
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
    ModularRouter('/user', child: (_, args) => LoggedPage()),
  ];

  static Inject get to => Inject<LoginModule>.of();
}
