// ignore_for_file: avoid_classes_with_only_static_members

import 'package:allfit_flutter/controllers/main_controller.dart';
import 'package:allfit_flutter/controllers/order_controller.dart';
import 'package:allfit_flutter/views/main_page.dart';
import 'package:allfit_flutter/views/order/category_selection_page.dart';
import 'package:allfit_flutter/views/order/deposit_info_page.dart';
import 'package:allfit_flutter/views/order/order_detail_page.dart';
import 'package:allfit_flutter/views/order/part_selection_page.dart';
import 'package:allfit_flutter/views/order/point_selection_page.dart';
import 'package:get/get.dart';

part 'routes.dart';

abstract class Pages {
  static final routes = [
    GetPage(
      name: Routes.MAIN,
      page: () => const MainPage(),
      binding: BindingsBuilder.put(() => MainController()),
    ),
    GetPage(
      name: Routes.CATEGORY_SELECTION,
      page: () => const CategorySelectionPage(),
      binding: BindingsBuilder.put(() => OrderController()),
    ),
    GetPage(
      name: Routes.PART_SELECTION,
      page: () => const PartSelectionPage(),
    ),
    GetPage(
      name: Routes.POINT_SELECTION,
      page: () => const PointSelectionPage(),
    ),
    GetPage(
      name: Routes.ORDER_DETAIL,
      page: () => const OrderDetailPage(),
    ),
    GetPage(
      name: Routes.DEPOSIT_INFO,
      page: () => const DepositInfoPage(),
    ),
  ];
}
