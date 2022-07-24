import 'package:allfit_flutter/constants/colors.dart';
import 'package:allfit_flutter/controllers/main_controller.dart';
import 'package:allfit_flutter/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Row(
              children: const [
                Image(
                  image: AssetImage("assets/images/main_background.png"),
                ),
              ],
            ),
            const Positioned(
              top: 225,
              right: 25,
              child: Text(
                "집에서 맡기는\n편한 수선",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: 40,
                  child: TextField(
                    controller: controller.addressEdit,
                    decoration: InputDecoration(
                      hintText: "어디에서 픽업할까요?",
                      prefixIcon: const Icon(Icons.search, size: 24),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    style: const TextStyle(fontSize: 16),
                    textAlignVertical: TextAlignVertical.bottom,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  height: 240,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 21),
                      InkWell(
                        onTap: () => Get.toNamed(Routes.CATEGORY_SELECTION),
                        child: Container(
                          color: backgroundColor,
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          height: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "수선 맡기기",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: Image(
                                  image: AssetImage("assets/images/camera.png"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 17),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          color: backgroundColor,
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          height: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "마이사이즈\n확인하기",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                height: 63,
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/avatar_pic.png",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/home.png")),
                label: "홈",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/repair.png")),
                label: "수선요청",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/history.png")),
                label: "이용내역",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/my_page.png")),
                label: "마이",
              ),
            ],
            onTap: (index) {
              controller.index = index;
            },
            currentIndex: controller.index,
            type: BottomNavigationBarType.fixed,
            iconSize: 28,
            selectedItemColor: const Color.fromRGBO(30, 30, 30, 1),
            unselectedItemColor: const Color.fromRGBO(207, 207, 207, 1),
            selectedLabelStyle: const TextStyle(fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
          );
        }),
      ),
    );
  }
}
