import 'package:allfit_flutter/domains/notice/notice.dart';
import 'package:get/get.dart';

class NoticeController extends GetxController {
  static NoticeController get to => Get.find();

  final categories = ["전체", "서비스 안내", "약관 안내"];

  final _notices = <Notice>[].obs;
  List<Notice> get notices => _notices;
  set notices(List<Notice> value) => _notices.value = value;

  @override
  void onReady() {}
}
