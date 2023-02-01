import 'package:boklo_mart/core/view_model/auth_view_model.dart';
import 'package:boklo_mart/core/view_model/control_view_model.dart';
import 'package:get/get.dart';


class Binding extends Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel(), fenix: true);
    Get.lazyPut(() => ControlViewModel(), fenix: true);

  }

}