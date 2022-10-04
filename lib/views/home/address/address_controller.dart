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
  final aliasEdit = TextEditingController();

  final _aliasEditEnabled = true.obs;
  bool get aliasEditEnabled => _aliasEditEnabled.value;
  set aliasEditEnabled(bool value) => _aliasEditEnabled.value = value;

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
    aliasEdit.dispose();
  }

  void resetTextEdit() {
    postCodeEdit.clear();
    roadAddressEdit.clear();
    detailAddressEdit.clear();
    aliasEdit.clear();
  }

  Future<void> addAddress() async {
    final address = Address(
      alias: aliasEdit.text.trim().isEmpty ? null : aliasEdit.text,
      postCode: postCodeEdit.text,
      roadAddress: roadAddressEdit.text,
      detailAddress: detailAddressEdit.text.trim(),
    );
    user = await userRepository.addAddress(user.id, address: address);
    resetTextEdit();
  }

  Future<void> changeMainAddress(Address address) async {
    final index = addresses.indexOf(address);
    if (index == user.mainAddressIndex) {
      return;
    }

    user = await userRepository.updateMainAddressIndex(
      user.id,
      index: index,
    );
  }

  Future<bool> removeAddress(Address address) async {
    final index = addresses.indexOf(address);
    if (index == user.mainAddressIndex) {
      return false;
    }

    await userRepository.removeAddress(user.id, address: address);
    user = await userRepository.updateMainAddressIndex(user.id, index: 0);
    return true;
  }
}
