import 'package:allfit_flutter/views/order/order_detail_page.dart';
import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PointSelectionPage extends StatelessWidget {
  const PointSelectionPage({super.key});

  static const route = "/order/point";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          children: [
            const Image(
              image: AssetImage("assets/images/clothes_sample.png"),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Text(
                          "티셔츠/맨투맨",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    // ...List.generate(
                    //   2,
                    //   (index) => ListTile(
                    //     leading: Icon(Icons.abc),
                    //     title: Text("총기장 줄임"),
                    //     subtitle: Text("6cm"),
                    //     trailing: Row(
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Text("수정"),
                    //         Text("삭제"),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Container(
                      height: 70,
                      child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) => ListTile(
                          leading: const FlutterLogo(size: 41),
                          title: const Text("총기장 줄임"),
                          subtitle: const Text("6cm"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text("수정"),
                              Text("삭제"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: const [
                          Icon(Icons.add, size: 12),
                          Text("수선 희망 부위 추가"),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("예상 가격"),
                        Text("12,000원~"),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              await bottomSheet(context);
                            },
                            child: const Text("다음"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 17),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> bottomSheet(BuildContext context) async {
    // return Get.bottomSheet(
    //   Container(),
    // );
    return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 28),
              Row(
                children: const [
                  Text(
                    "매칭된 수선업체",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Get.toNamed(OrderDetailPage.route),
                      child: const Text("주문하기"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
