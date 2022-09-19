import 'package:allfit_flutter/controllers/main_controller.dart';
import 'package:allfit_flutter/views/home/address/address_setting_page.dart';
import 'package:allfit_flutter/widgets/toast.dart';
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
                showToast("로그인 후 이용가능합니다");
              } else {
                Get.to(() => const AddressSettingPage());
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "배송 주소 설정",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
        Stack(
          children: [
            const Image(
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
                child: const SizedBox(
                  height: 100,
                  child: Image(
                    image: AssetImage("assets/images/price_table.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
