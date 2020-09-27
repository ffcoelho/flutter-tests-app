import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tests_app/app/shared/models/user_model.dart';
import 'login_controller.dart';

class LoggedPage extends StatefulWidget {
  final String title;
  const LoggedPage({Key key, this.title = "Success"}) : super(key: key);

  @override
  _LoggedPageState createState() => _LoggedPageState();
}

class _LoggedPageState extends ModularState<LoggedPage, LoginController> {

  UserModel user;

  @override
  void initState() {
    super.initState();
    this.user = controller.user;
    debugPrint('LoggedPage.initState() - user: ${user.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 82,
              backgroundColor: Colors.blueGrey[700],
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage('https://fake-api-helper.herokuapp.com${user.photoUrl}'),
              ),
            ),
            Text(user.name),
            Text(user.email),
          ],
        )
      )
    );
  }
}
