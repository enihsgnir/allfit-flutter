import 'package:allfit_flutter/domains/faq/faq.dart';
import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/utils/formats.dart';
import 'package:allfit_flutter/views/my_page/faq/faq_controller.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  static const route = "/my_page/faq";

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> with TickerProviderStateMixin {
  final controller = FAQController.to;

  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "자주 묻는 질문"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            controller: tabController,
            isScrollable: true,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            tabs: controller.categories
                .map(
                  (e) => Tab(
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Obx(() {
            return Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  SingleChildScrollView(
                    child: ExpansionPanelList.radio(
                      children: controller.faqs
                          .map((e) => FAQExpansionPanel(e))
                          .toList(),
                    ),
                  ),
                  ...List.generate(
                    controller.categories.length - 1,
                    (index) => SingleChildScrollView(
                      child: ExpansionPanelList.radio(
                        children: controller
                            .categorizedFAQs(index + 1)
                            .map((e) => FAQExpansionPanel(e))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class FAQExpansionPanel extends ExpansionPanelRadio {
  final FAQ faq;

  FAQExpansionPanel(this.faq)
      : super(
          value: faq.id,
          headerBuilder: (context, isExpanded) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        faq.category,
                        style: const TextStyle(
                          color: greyPointColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        formatDateTimeDotted(faq.createdAt),
                        style: const TextStyle(
                          color: greyPointColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    faq.title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            color: backgroundColor,
            constraints: const BoxConstraints(minHeight: 180),
            child: Text(
              faq.contents,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          canTapOnHeader: true,
        );
}
