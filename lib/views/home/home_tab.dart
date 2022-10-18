import 'package:allfit_flutter/domains/user/user.dart';
import 'package:allfit_flutter/views/home/address/address_page.dart';
import 'package:allfit_flutter/views/home/price_table_page.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_in_page.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
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
              if (controller.currentUser == null) {
                Get.toNamed(SignInPage.route);
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
                      Image(
                        height: 16,
                        image: AssetImage(
                          address.isHome
                              ? "assets/images/icon_address_home.png"
                              : address.isWork
                                  ? "assets/images/icon_address_work.png"
                                  : "assets/images/icon_address_location.png",
                        ),
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
                      height: 64,
                      thickness: 2,
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
                      onTap: () {
                        Get.toNamed(PriceTablePage.route);
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("assets/images/price_table.png"),
                          ),
                          borderRadius: BorderRadius.circular(16),
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
                                "7,500원 ~",
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
                    const CustomBottomPadding(),
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
