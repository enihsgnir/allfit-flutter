import 'package:allfit_flutter/domains/notice/notice.dart';
import 'package:allfit_flutter/domains/notice/notice_repository.dart';
import 'package:get/get.dart';

class NoticeController extends GetxController {
  static NoticeController get to => Get.find();

  final categories = ["전체", "서비스 안내", "약관 안내"];

  final _notices = <Notice>[].obs;
  List<Notice> get notices => _notices;
  set notices(List<Notice> value) => _notices.value = value;

  @override
  Future<void> onReady() async {
    await getNotices();
  }

  Future<void> getNotices() async {
    notices = await noticeRepository.getAll()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  List<Notice> categorizedNotices(int index) {
    return notices
        .where((element) => element.category == categories[index])
        .toList();
  }
}
