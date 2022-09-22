import 'package:allfit_flutter/views/home/address/address_controller.dart';
import 'package:allfit_flutter/views/home/address/address_setting_page.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/views/main_page.dart';
import 'package:allfit_flutter/views/my_page/alter_service_page.dart';
import 'package:allfit_flutter/views/my_page/coupon/coupon_controller.dart';
import 'package:allfit_flutter/views/my_page/coupon/coupon_page.dart';
import 'package:allfit_flutter/views/my_page/faq/faq_controller.dart';
import 'package:allfit_flutter/views/my_page/faq/faq_page.dart';
import 'package:allfit_flutter/views/my_page/inquiry/inquiry_page.dart';
import 'package:allfit_flutter/views/my_page/inquiry/inquiry_writing_controller.dart';
import 'package:allfit_flutter/views/my_page/inquiry/inquiry_writing_page.dart';
import 'package:allfit_flutter/views/my_page/my_info/my_info_controller.dart';
import 'package:allfit_flutter/views/my_page/my_info/my_info_page.dart';
import 'package:allfit_flutter/views/my_page/notice/notice_controller.dart';
import 'package:allfit_flutter/views/my_page/notice/notice_page.dart';
import 'package:allfit_flutter/views/my_page/payment_history/payment_history_controller.dart';
import 'package:allfit_flutter/views/my_page/payment_history/payment_history_page.dart';
import 'package:allfit_flutter/views/my_page/reward_point/reward_point_page.dart';
import 'package:allfit_flutter/views/my_page/reward_point/reward_point_registration_controller.dart';
import 'package:allfit_flutter/views/my_page/reward_point/reward_point_registration_page.dart';
import 'package:allfit_flutter/views/my_page/settings_page.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_in_controller.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_in_page.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_up/sign_up_completion_page.dart';
import 'package:allfit_flutter/views/order/category_selection_page.dart';
import 'package:allfit_flutter/views/order/deposit_info_page.dart';
import 'package:allfit_flutter/views/order/order_controller.dart';
import 'package:allfit_flutter/views/order/order_detail_page.dart';
import 'package:allfit_flutter/views/order/part_selection_page.dart';
import 'package:allfit_flutter/views/order/point_selection_page.dart';
import 'package:get/get.dart';

abstract class Pages {
  const Pages._();

  static final routes = [
    // main
    GetPage(
      name: MainPage.route,
      page: () => const MainPage(),
      binding: BindingsBuilder.put(() => MainController()),
    ),

    // home
    GetPage(
      name: AddressSettingPage.route,
      page: () => const AddressSettingPage(),
      binding: BindingsBuilder.put(() => AddressController()),
    ),

    // order
    GetPage(
      name: CategorySelectionPage.route,
      page: () => const CategorySelectionPage(),
      binding: BindingsBuilder.put(() => OrderController()),
    ),
    GetPage(
      name: PartSelectionPage.route,
      page: () => const PartSelectionPage(),
    ),
    GetPage(
      name: PointSelectionPage.route,
      page: () => const PointSelectionPage(),
    ),
    GetPage(
      name: OrderDetailPage.route,
      page: () => const OrderDetailPage(),
    ),
    GetPage(
      name: DepositInfoPage.route,
      page: () => const DepositInfoPage(),
    ),

    // my_page
    GetPage(
      name: SignUpCompletionPage.route,
      page: () => const SignUpCompletionPage(),
    ),
    GetPage(
      name: SignInPage.route,
      page: () => const SignInPage(),
      binding: BindingsBuilder.put(() => SignInController()),
    ),
    GetPage(
      name: CouponPage.route,
      page: () => const CouponPage(),
      binding: BindingsBuilder.put(() => CouponController()),
    ),
    GetPage(
      name: RewardPointPage.route,
      page: () => const RewardPointPage(),
    ),
    GetPage(
      name: RewardPointRegistrationPage.route,
      page: () => const RewardPointRegistrationPage(),
      binding: BindingsBuilder.put(() => RewardPointRegistrationController()),
    ),
    GetPage(
      name: PaymentHistoryPage.route,
      page: () => const PaymentHistoryPage(),
      binding: BindingsBuilder.put(() => PaymentHistoryController()),
    ),
    GetPage(
      name: MyInfoPage.route,
      page: () => const MyInfoPage(),
      binding: BindingsBuilder.put(() => MyInfoController()),
    ),
    GetPage(
      name: AlterServicePage.route,
      page: () => const AlterServicePage(),
    ),
    GetPage(
      name: NoticePage.route,
      page: () => const NoticePage(),
      binding: BindingsBuilder.put(() => NoticeController()),
    ),
    GetPage(
      name: SettingsPage.route,
      page: () => const SettingsPage(),
    ),
    GetPage(
      name: FAQPage.route,
      page: () => const FAQPage(),
      binding: BindingsBuilder.put(() => FAQController()),
    ),
    GetPage(
      name: InquiryPage.route,
      page: () => const InquiryPage(),
    ),
    GetPage(
      name: InquiryWritingPage.route,
      page: () => const InquiryWritingPage(),
      binding: BindingsBuilder.put(() => InquiryWritingController()),
    ),
  ];
}
