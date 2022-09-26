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

  final _addresses = <Address>[].obs;
  List<Address> get addresses => _addresses;
  set addresses(List<Address> value) => _addresses.value = value;

  Address? get home =>
      addresses.firstWhereOrNull((element) => element.alias == "집");

  Address? get work =>
      addresses.firstWhereOrNull((element) => element.alias == "회사");

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
  }

  @override
  void onClose() {
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
    addresses = user.addresses;
  }
}
