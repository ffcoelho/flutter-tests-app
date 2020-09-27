import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../errors/errors.dart';

import '../../models/auth_model.dart';
import '../../models/user_model.dart';

abstract class IUserRepository implements Disposable {
  Future<Either<Failure, UserModel>> login(AuthModel login);
}