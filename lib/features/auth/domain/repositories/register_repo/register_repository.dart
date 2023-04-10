import 'package:boklo_mart/features/auth/domain/repositories/register_repo/register_method.dart';

class RegisterRepository {
  Future<void> registerWith(RegisterMethod method) async {
    await method.register();
  }
}
