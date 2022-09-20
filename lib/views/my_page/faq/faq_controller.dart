import 'package:allfit_flutter/domains/faq/faq.dart';
import 'package:allfit_flutter/domains/faq/faq_repository.dart';
import 'package:get/get.dart';

class FAQController extends GetxController {
  static FAQController get to => Get.find();

  final categories = ["전체", "광고", "정보수정", "결제 및 정산", "리뷰", "주문접수프로그램", "기타"];

  final _faqs = <FAQ>[].obs;
  List<FAQ> get faqs => _faqs;
  set faqs(List<FAQ> value) => _faqs.value = value;

  @override
  Future<void> onReady() async {
    await getFAQs();
  }

  Future<void> getFAQs() async {
    faqs = await faqRepository.getAll()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  List<FAQ> categorizedFAQs(int index) {
    return faqs
        .where((element) => element.category == categories[index])
        .toList();
  }
}
