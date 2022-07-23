import 'package:flutter/material.dart';

class PointSelectionPage extends StatelessWidget {
  const PointSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage("assets/images/clothes_sample.png"),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      children: [
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
                          leading: Icon(Icons.abc),
                          title: Text("총기장 줄임"),
                          subtitle: Text("6cm"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
                        children: [
                          Icon(Icons.add, size: 12),
                          Text("수선 희망 부위 추가"),
                        ],
                      ),
                    ),
                    Spacer(),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                            child: Text("다음"),
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
    return showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Text("매칭된 수선업체"),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("주문하기"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
