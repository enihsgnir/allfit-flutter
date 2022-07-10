// ignore_for_file: avoid_classes_with_only_static_members

import 'package:allfit_flutter/views/intro_page.dart';
import 'package:get/get.dart';

part 'routes.dart';

abstract class Pages {
  static final routes = [
    GetPage(
      name: Routes.INTRO,
      page: () => const IntroPage(),
    ),
  ];
}
