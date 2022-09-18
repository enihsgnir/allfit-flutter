import 'package:allfit_flutter/controllers/main_controller.dart';
import 'package:allfit_flutter/views/main_page.dart';
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
    GetPage(
      name: MainPage.route,
      page: () => const MainPage(),
      binding: BindingsBuilder.put(() => MainController()),
    ),
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
      name: SignUpCompletionPage.route,
      page: () => const SignUpCompletionPage(),
    ),
    GetPage(
      name: SignInPage.route,
      page: () => const SignInPage(),
      binding: BindingsBuilder.put(() => SignInController()),
    ),
  ];
}
