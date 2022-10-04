import 'package:allfit_flutter/domains/user/user.dart';
import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/home/address/address_controller.dart';
import 'package:allfit_flutter/views/home/address/address_search_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_cached_image.dart';
import 'package:allfit_flutter/widgets/custom_modal_bottom_sheet.dart';
import 'package:allfit_flutter/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intersperse/intersperse.dart';

class AddressPage extends GetView<AddressController> {
  const AddressPage({super.key});

  static const route = "/home/address";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(title: "주소 설정"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Obx(() {
                if (controller.isAddressEditing) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              enabled: false,
                              controller: controller.postCodeEdit,
                              decoration: const InputDecoration(
                                hintText: "우편번호",
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 12),
                              ),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(
                                  AddressSearchPage.route,
                                  arguments: [
                                    controller.postCodeEdit,
                                    controller.roadAddressEdit,
                                  ],
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  "우편번호 검색",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        enabled: false,
                        controller: controller.roadAddressEdit,
                        decoration: const InputDecoration(
                          hintText: "주소",
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: controller.detailAddressEdit,
                        decoration: const InputDecoration(
                          hintText: "상세주소",
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      Obx(() {
                        return TextFormField(
                          enabled: controller.aliasEditEnabled,
                          controller: controller.aliasEdit,
                          decoration: const InputDecoration(
                            hintText: "별명",
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                          ),
                          style: const TextStyle(fontSize: 12),
                        );
                      }),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                controller.isAddressEditing = false;
                                controller.resetTextEdit();
                              },
                              child: const Text(
                                "취소",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                await controller.addAddress();
                                controller.isAddressEditing = false;
                              },
                              child: const Text(
                                "확인",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
                return Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          controller.aliasEditEnabled = true;
                          controller.isAddressEditing = true;
                        },
                        child: const Text("주소 추가"),
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    Obx(() {
                      final home = controller.home;
                      return AddressListTile(
                        address: home,
                        icon: "home",
                      );
                    }),
                    const Divider(),
                    Obx(() {
                      final work = controller.work;
                      return AddressListTile(
                        address: work,
                        icon: "work",
                      );
                    }),
                    Obx(() {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: controller.others
                            .map<Widget>(
                              (e) => AddressListTile(
                                address: e,
                                icon: "location",
                              ),
                            )
                            .intersperseOuter(const Divider())
                            .toList(),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressListTile extends GetView<AddressController> {
  final Address? address;
  final String icon;

  const AddressListTile({
    super.key,
    required this.address,
    required this.icon,
  });

  bool get isHome => icon == "home";
  bool get isWork => icon == "work";

  String get title {
    final address = this.address;
    final alias = address?.alias;

    if (address == null) {
      if (isHome) {
        return "집 추가";
      } else if (isWork) {
        return "회사 추가";
      }
      return "";
    } else {
      if (isHome) {
        return "집";
      } else if (isWork) {
        return "회사";
      } else if (alias != null) {
        return alias;
      }
      return address.detailAddress;
    }
  }

  @override
  Widget build(BuildContext context) {
    final address = this.address;
    final mainAddressIndex = controller.user.mainAddressIndex;

    return ListTile(
      leading: CustomCachedImage(
        width: 20,
        height: double.infinity,
        path: "icons/address/$icon.png",
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        address == null ? "" : address.roadAddress,
        style: const TextStyle(fontSize: 11),
      ),
      trailing: address == null ||
              mainAddressIndex != controller.addresses.indexOf(address)
          ? null
          : const Icon(Icons.check),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      onTap: address == null
          ? isHome || isWork
              ? () {
                  if (isHome) {
                    controller.aliasEdit.text = "집";
                  } else if (isWork) {
                    controller.aliasEdit.text = "회사";
                  }
                  controller.aliasEditEnabled = false;
                  controller.isAddressEditing = true;
                }
              : null
          : () => showAddressActionSheet(context, address: address),
    );
  }

  Future<void> showAddressActionSheet(
    BuildContext context, {
    required Address address,
  }) async {
    return showCustomModalBottomSheet(
      context: context,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(),
            TextButton(
              onPressed: () async {
                await controller.changeMainAddress(address);
                Get.back();
              },
              child: const Text("대표 주소로 설정"),
            ),
            const Divider(),
            TextButton(
              onPressed: () async {
                if (await controller.removeAddress(address)) {
                  Get.back();
                } else {
                  showCustomToast("대표 주소는 삭제할 수 없습니다.");
                }
              },
              child: const Text("삭제"),
            ),
            const Divider(),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("취소"),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
