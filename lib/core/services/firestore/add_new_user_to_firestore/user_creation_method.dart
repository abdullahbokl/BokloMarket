import 'package:boklo_mart/core/common/models/user_model.dart';

abstract class UserCreationMethod {
  Future<void> createUserIfNotExist(UserModel user);
}
