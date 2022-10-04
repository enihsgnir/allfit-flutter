import 'package:allfit_flutter/views/admin/admin_main_controller.dart';
import 'package:allfit_flutter/views/admin/admin_main_page.dart';
import 'package:allfit_flutter/views/history/history_detail_page.dart';
import 'package:allfit_flutter/views/history/history_list_page.dart';
import 'package:allfit_flutter/views/home/address/address_controller.dart';
import 'package:allfit_flutter/views/home/address/address_page.dart';
import 'package:allfit_flutter/views/home/address/address_search_page.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/views/main_page.dart';
import 'package:allfit_flutter/views/my_page/alter_service/alter_service_change_page.dart';
import 'package:allfit_flutter/views/my_page/alter_service/alter_service_controller.dart';
import 'package:allfit_flutter/views/my_page/alter_service/alter_service_page.dart';
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
import 'package:allfit_flutter/views/my_page/payment_history/payment_history_detail_page.dart';
import 'package:allfit_flutter/views/my_page/payment_history/payment_history_page.dart';
import 'package:allfit_flutter/views/my_page/reward_point/reward_point_page.dart';
import 'package:allfit_flutter/views/my_page/reward_point/reward_point_registration_controller.dart';
import 'package:allfit_flutter/views/my_page/reward_point/reward_point_registration_page.dart';
import 'package:allfit_flutter/views/my_page/settings_page.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_in_controller.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_in_page.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_up/account_detail_page.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_up/agreement_page.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_up/sign_up_completion_page.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_up/sign_up_controller.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_up/sign_up_page.dart';
import 'package:allfit_flutter/views/order/category_selection_page.dart';
import 'package:allfit_flutter/views/order/deposit_info_page.dart';
import 'package:allfit_flutter/views/order/my_size/my_size_page.dart';
import 'package:allfit_flutter/views/order/order_controller.dart';
import 'package:allfit_flutter/views/order/order_detail_page.dart';
import 'package:allfit_flutter/views/order/part_selection_page.dart';
import 'package:allfit_flutter/views/order/point_selection_page.dart';
import 'package:allfit_flutter/views/tailor/main/detail/tailor_order_detail_controller.dart';
import 'package:allfit_flutter/views/tailor/main/detail/tailor_order_detail_page.dart';
import 'package:allfit_flutter/views/tailor/main/detail/tailor_order_settle_page.dart';
import 'package:allfit_flutter/views/tailor/main/tailor_main_controller.dart';
import 'package:allfit_flutter/views/tailor/main/tailor_main_page.dart';
import 'package:allfit_flutter/views/tailor/sign_in/sign_up/tailor_account_detail_page.dart';
import 'package:allfit_flutter/views/tailor/sign_in/sign_up/tailor_sign_up_controller.dart';
import 'package:allfit_flutter/views/tailor/sign_in/sign_up/tailor_sign_up_page.dart';
import 'package:allfit_flutter/views/tailor/sign_in/tailor_sign_in_controller.dart';
import 'package:allfit_flutter/views/tailor/sign_in/tailor_sign_in_page.dart';
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
      name: AddressPage.route,
      page: () => const AddressPage(),
      binding: BindingsBuilder.put(() => AddressController()),
    ),
    GetPage(
      name: AddressSearchPage.route,
      page: () => const AddressSearchPage(),
    ),

    // history
    GetPage(
      name: HistoryListPage.route,
      page: () => const HistoryListPage(),
    ),
    GetPage(
      name: HistoryDetailPage.route,
      page: () => const HistoryDetailPage(),
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
    GetPage(
      name: MySizePage.route,
      page: () => const MySizePage(),
    ),

    // my_page
    GetPage(
      name: SignInPage.route,
      page: () => const SignInPage(),
      binding: BindingsBuilder.put(() => SignInController()),
    ),
    GetPage(
      name: AgreementPage.route,
      page: () => const AgreementPage(),
      binding: BindingsBuilder.put(() => SignUpController()),
    ),
    GetPage(
      name: SignUpPage.route,
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: AccountDetailPage.route,
      page: () => const AccountDetailPage(),
    ),
    GetPage(
      name: SignUpCompletionPage.route,
      page: () => const SignUpCompletionPage(),
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
      name: PaymentHistoryDetailPage.route,
      page: () => const PaymentHistoryDetailPage(),
    ),
    GetPage(
      name: MyInfoPage.route,
      page: () => const MyInfoPage(),
      binding: BindingsBuilder.put(() => MyInfoController()),
    ),
    GetPage(
      name: AlterServicePage.route,
      page: () => const AlterServicePage(),
      binding: BindingsBuilder.put(() => AlterServiceController()),
    ),
    GetPage(
      name: AlterServiceChangePage.route,
      page: () => const AlterServiceChangePage(),
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

    // tailor
    GetPage(
      name: TailorMainPage.route,
      page: () => const TailorMainPage(),
      binding: BindingsBuilder.put(() => TailorMainController()),
    ),
    GetPage(
      name: TailorOrderDetailPage.route,
      page: () => const TailorOrderDetailPage(),
      binding: BindingsBuilder.put(() => TailorOrderDetailController()),
    ),
    GetPage(
      name: TailorOrderSettlePage.route,
      page: () => const TailorOrderSettlePage(),
    ),
    GetPage(
      name: TailorSignInPage.route,
      page: () => const TailorSignInPage(),
      binding: BindingsBuilder.put(() => TailorSignInController()),
    ),
    GetPage(
      name: TailorSignUpPage.route,
      page: () => const TailorSignUpPage(),
      binding: BindingsBuilder.put(() => TailorSignUpController()),
    ),
    GetPage(
      name: TailorAccountDetailPage.route,
      page: () => const TailorAccountDetailPage(),
    ),

    // admin
    GetPage(
      name: AdminMainPage.route,
      page: () => const AdminMainPage(),
      binding: BindingsBuilder.put(() => AdminMainController()),
    ),
  ];
}
