import 'package:allfit_flutter/domains/notice/notice.dart';
import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/utils/extensions.dart';
import 'package:allfit_flutter/views/my_page/notice/notice_controller.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({super.key});

  static const route = "/my_page/notice";

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> with TickerProviderStateMixin {
  final controller = NoticeController.to;

  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "공지사항"),
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
                      children: controller.notices
                          .map((e) => NoticeExpansionPanel(e))
                          .toList(),
                    ),
                  ),
                  ...List.generate(
                    controller.categories.length - 1,
                    (index) => SingleChildScrollView(
                      child: ExpansionPanelList.radio(
                        children: controller
                            .categorizedNotices(index + 1)
                            .map((e) => NoticeExpansionPanel(e))
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

class NoticeExpansionPanel extends ExpansionPanelRadio {
  final Notice notice;

  NoticeExpansionPanel(this.notice)
      : super(
          value: notice.id,
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
                        notice.category,
                        style: const TextStyle(
                          color: greyIconColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        notice.createdAt.toFormatted(isDotSeparated: true),
                        style: const TextStyle(
                          color: greyIconColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notice.title,
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
            color: lightGreyBackgroundColor,
            constraints: const BoxConstraints(minHeight: 180),
            child: Text(
              notice.contents,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          canTapOnHeader: true,
        );
}
