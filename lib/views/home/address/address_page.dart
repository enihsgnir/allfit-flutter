import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/home/address/address_controller.dart';
import 'package:allfit_flutter/views/home/address/address_search_page.dart';
import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:allfit_flutter/widgets/default_cached_image.dart';
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
        appBar: const DefaultAppBar(title: "주소 설정"),
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
                                "변경 취소",
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
                  leading: const DefaultCachedImage(
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
                  contentPadding: EdgeInsets.zero,
                  onTap: () {},
                );
              }),
              const Divider(),
              Obx(() {
                final work = controller.work;
                return ListTile(
                  leading: const DefaultCachedImage(
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
                  contentPadding: EdgeInsets.zero,
                  onTap: () {},
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
                        leading: const DefaultCachedImage(
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
                        contentPadding: EdgeInsets.zero,
                        onTap: () {},
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
}
