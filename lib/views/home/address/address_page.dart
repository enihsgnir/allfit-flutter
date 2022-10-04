import 'package:allfit_flutter/domains/user/user.dart';
import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/home/address/address_controller.dart';
import 'package:allfit_flutter/views/home/address/address_search_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_cached_image.dart';
import 'package:allfit_flutter/widgets/custom_modal_bottom_sheet.dart';
import 'package:allfit_flutter/widgets/unprepared_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                controller.isAddressEditing = false;
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
                          controller.postCodeEdit.text = "";
                          controller.roadAddressEdit.text = "";
                          controller.detailAddressEdit.text = "";
                          controller.isAddressEditing = true;
                        },
                        child: const Text("주소 추가"),
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 20),
              Obx(() {
                final home = controller.home;
                return ListTile(
                  leading: const CustomCachedImage(
                    width: 16,
                    path: "icons/address/home.png",
                  ),
                  title: Text(
                    home == null ? "집 추가" : "집",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: home == null
                      ? null
                      : Text(
                          home.roadAddress,
                          style: const TextStyle(fontSize: 11),
                        ),
                  trailing: home == null ||
                          controller.user.mainAddressIndex !=
                              controller.addresses.indexOf(home)
                      ? null
                      : const Icon(Icons.check),
                  contentPadding: EdgeInsets.zero,
                  onTap: home == null
                      ? null
                      : () {
                          showAddressActionSheet(
                            context: context,
                            address: home,
                          );
                        },
                );
              }),
              const Divider(),
              Obx(() {
                final work = controller.work;
                return ListTile(
                  leading: const CustomCachedImage(
                    width: 16,
                    path: "icons/address/work.png",
                  ),
                  title: Text(
                    work == null ? "회사 추가" : "회사",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: work == null
                      ? null
                      : Text(
                          work.roadAddress,
                          style: const TextStyle(fontSize: 11),
                        ),
                  trailing: work == null ||
                          controller.user.mainAddressIndex !=
                              controller.addresses.indexOf(work)
                      ? null
                      : const Icon(Icons.check),
                  contentPadding: EdgeInsets.zero,
                  onTap: work == null
                      ? null
                      : () {
                          showAddressActionSheet(
                            context: context,
                            address: work,
                          );
                        },
                );
              }),
              const Divider(),
              Expanded(
                child: Obx(() {
                  return ListView.separated(
                    itemCount: controller.others.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final address = controller.others[index];
                      return ListTile(
                        leading: const CustomCachedImage(
                          width: 16,
                          path: "icons/address/location.png",
                        ),
                        title: Text(
                          address.detailAddress,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          address.roadAddress,
                          style: const TextStyle(fontSize: 11),
                        ),
                        trailing: controller.user.mainAddressIndex !=
                                controller.addresses.indexOf(address)
                            ? null
                            : const Icon(Icons.check),
                        contentPadding: EdgeInsets.zero,
                        onTap: () {
                          showAddressActionSheet(
                            context: context,
                            address: address,
                          );
                        },
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showAddressActionSheet({
    required BuildContext context,
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
                final index = controller.addresses.indexOf(address);
                await controller.changeMainAddress(index);
                Get.back();
              },
              child: const Text("대표 주소로 설정"),
            ),
            const Divider(),
            TextButton(
              onPressed: () {
                Get.back();
                showUnpreparedDialog(context);
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

class AddressListTile extends StatelessWidget {
  final String? alias;
  final Address? address;
  final String icon;

  const AddressListTile({
    super.key,
    this.alias,
    required this.address,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final address = this.address;
    return ListTile(
      leading: CustomCachedImage(
        height: 16,
        path: "icons/address/$icon.png",
      ),
      title: Text(
        address == null ? "집 추가" : "집",
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: address == null
          ? null
          : Text(
              address.roadAddress,
              style: const TextStyle(fontSize: 11),
            ),
      contentPadding: EdgeInsets.zero,
      onTap: address == null ? null : () {},
    );
  }
}
