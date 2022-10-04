import 'package:allfit_flutter/domains/user/user.dart';
import 'package:allfit_flutter/views/home/address/address_page.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/widgets/custom_cached_image.dart';
import 'package:allfit_flutter/widgets/custom_toast.dart';
import 'package:allfit_flutter/widgets/unprepared_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTab extends GetView<MainController> {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        SizedBox(
          height: 50,
          child: InkWell(
            onTap: () {
              if (!controller.isSignedIn) {
                showCustomToast("로그인 후 이용가능합니다");
              } else {
                Get.toNamed(AddressPage.route);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  final user = controller.currentUser;
                  if (user == null) {
                    return const Text(
                      "배송 주소 설정",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }

                  final index = user.mainAddressIndex;
                  final address = user.addresses[index];
                  return Row(
                    children: [
                      CustomCachedImage(
                        height: 16,
                        path: address.isHome
                            ? "icons/address/home.png"
                            : address.isWork
                                ? "icons/address/work.png"
                                : "icons/address/location.png",
                      ),
                      const SizedBox(width: 8),
                      Text(
                        address.isHome
                            ? Address.homeKo
                            : address.isWork
                                ? Address.workKo
                                : address.roadAddress,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                }),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: 28,
                  height: 12,
                  child: const Icon(
                    CupertinoIcons.chevron_down,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                children: [
                  const Image(
                    fit: BoxFit.fitWidth,
                    image: AssetImage("assets/images/home_tab_background.png"),
                  ),
                  Positioned(
                    right: 12,
                    bottom: 36,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "환경을 위한 솔선수선",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "수선으로 시작하는\n친환경 라이프스타일",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      height: 48,
                      color: Colors.black,
                    ),
                    const Text(
                      "얼핏이 처음이세요?",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () => showUnpreparedDialog(context),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("assets/images/price_table.png"),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "수선 가격표",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "언제 어디서든 일정한 가격",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "7,500원~ ",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
