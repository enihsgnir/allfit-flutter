import 'package:allfit_flutter/domains/user/user.dart';
import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/views/my_page/alter_service_page.dart';
import 'package:allfit_flutter/views/my_page/coupon/coupon_page.dart';
import 'package:allfit_flutter/views/my_page/faq/faq_page.dart';
import 'package:allfit_flutter/views/my_page/inquiry/inquiry_page.dart';
import 'package:allfit_flutter/views/my_page/my_info/my_info_page.dart';
import 'package:allfit_flutter/views/my_page/notice/notice_page.dart';
import 'package:allfit_flutter/views/my_page/payment_history/payment_history_page.dart';
import 'package:allfit_flutter/views/my_page/reward_point/reward_point_page.dart';
import 'package:allfit_flutter/views/my_page/settings_page.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_in_page.dart';
import 'package:allfit_flutter/widgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class MyPageTab extends GetView<MainController> {
  const MyPageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        const SizedBox(height: 36),
        Obx(() {
          if (!controller.isSignedIn) {
            return Row(
              children: [
                const SizedBox(width: 12),
                TextButton(
                  onPressed: () {
                    Get.toNamed(SignInPage.route);
                  },
                  child: const Text(
                    "로그인 해주세요",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            );
          }
          return Row(
            children: [
              const SizedBox(width: 24),
              const Image(
                image: AssetImage("assets/images/circle_avatar.png"),
              ),
              const SizedBox(width: 12),
              Text(
                "${controller.currentUser.username}님",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 20,
                child: OutlinedButton(
                  onPressed: () async {
                    await controller.signOut();
                    showToast("로그아웃 성공!");
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    side: const BorderSide(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "로그아웃",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              const SizedBox(width: 24),
            ],
          );
        }),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(CouponPage.route);
              },
              child: Column(
                children: const [
                  Image(
                    image: AssetImage("assets/images/coupon.png"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "쿠폰",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(RewardPointPage.route);
              },
              child: Column(
                children: const [
                  Image(
                    image: AssetImage("assets/images/reward_point.png"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "포인트",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(PaymentHistoryPage.route);
              },
              child: Column(
                children: const [
                  Image(
                    image: AssetImage("assets/images/payment_history.png"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "결제내역",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(MyInfoPage.route);
              },
              child: Column(
                children: const [
                  Image(
                    image: AssetImage("assets/images/my_info.png"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "내 정보",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(),
        ListTile(
          title: const Text(
            "이용 중인 서비스",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: const Icon(CupertinoIcons.chevron_forward),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          onTap: () {
            Get.toNamed(AlterServicePage.route);
          },
        ),
        Container(
          height: 9,
          color: backgroundColor,
        ),
        ListTile(
          title: const Text(
            "친구 초대하기",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: const Icon(CupertinoIcons.chevron_forward),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          onTap: () async {
            final box = context.findRenderObject() as RenderBox?;
            Share.share(
              "집에서 맡기는 편한 수선! 얼핏 All Fit",
              sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
            );
          },
        ),
        ListTile(
          title: const Text(
            "공지사항",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: const Icon(CupertinoIcons.chevron_forward),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          onTap: () {
            Get.toNamed(NoticePage.route);
          },
        ),
        ListTile(
          title: const Text(
            "설정",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: const Icon(CupertinoIcons.chevron_forward),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          onTap: () {
            Get.toNamed(SettingsPage.route);
          },
        ),
        const Spacer(),
        Row(
          children: const [
            SizedBox(width: 24),
            Text(
              "고객센터",
              style: TextStyle(
                color: Color.fromRGBO(177, 177, 177, 1),
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        ListTile(
          title: const Text(
            "자주 묻는 질문",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          onTap: () {
            Get.toNamed(FAQPage.route);
          },
        ),
        ListTile(
          title: const Text(
            "1:1 문의하기",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          onTap: () {
            Get.toNamed(InquiryPage.route);
          },
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
