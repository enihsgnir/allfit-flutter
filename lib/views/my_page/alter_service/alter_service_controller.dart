import 'package:allfit_flutter/domains/user/user.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:get/get.dart';

class AlterServiceController extends GetxController {
  static AlterServiceController get to => Get.find();

  late final Rx<User> _user;
  User get user => _user.value;
  set user(User value) => _user.value = value;

  @override
  void onInit() {
    super.onInit();
    _user = MainController.to.currentUser!.obs;
  }
}
