import 'package:allfit_flutter/domains/user/user.dart';
import 'package:allfit_flutter/domains/user/user_repository.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get to => Get.find();

  late final Rx<User> _user;
  User get user => _user.value;
  set user(User value) => _user.value = value;

  Worker? _userWorker;

  final _addresses = <Address>[].obs;
  List<Address> get addresses => _addresses;
  set addresses(List<Address> value) => _addresses.value = value;

  Address? get home => addresses.firstWhereOrNull((element) => element.isHome);

  Address? get work => addresses.firstWhereOrNull((element) => element.isWork);

  List<Address> get others => List.of(addresses)
    ..remove(home)
    ..remove(work);

  final _isAddressEditing = false.obs;
  bool get isAddressEditing => _isAddressEditing.value;
  set isAddressEditing(bool value) => _isAddressEditing.value = value;

  final postCodeEdit = TextEditingController();
  final roadAddressEdit = TextEditingController();
  final detailAddressEdit = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _user = MainController.to.currentUser!.obs;
    addresses = user.addresses;
    _userWorker = ever(_user, (_) {
      MainController.to.currentUser = user;
      addresses = user.addresses;
    });
  }

  @override
  void onClose() {
    _userWorker?.dispose();

    postCodeEdit.dispose();
    roadAddressEdit.dispose();
    detailAddressEdit.dispose();
  }

  Future<void> addAddress({String? alias}) async {
    final address = Address(
      alias: alias,
      postCode: postCodeEdit.text,
      roadAddress: roadAddressEdit.text,
      detailAddress: detailAddressEdit.text.trim(),
    );
    user = await userRepository.addAddress(user.id, address);
  }

  Future<void> changeMainAddress(int index) async {
    if (index == user.mainAddressIndex) {
      return;
    }

    user = await userRepository.updateMainAddressIndex(
      user.id,
      index: index,
    );
  }
}
