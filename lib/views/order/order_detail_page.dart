import 'package:allfit_flutter/routes/pages.dart';
import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: "주문 상세"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Column(
              children: const [
                ListTile(
                  leading: FlutterLogo(size: 37),
                  title: Text(
                    "티셔츠/맨투맨  1개",
                    style: TextStyle(fontSize: 15),
                  ),
                  subtitle: Text(
                    "총기장 줄임 6cm",
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: Text(
                    "12,000원~",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Text(
                  "수선업체: 더현대서울 실과바늘",
                  style: TextStyle(
                    color: Color.fromRGBO(177, 177, 177, 1),
                    fontSize: 12,
                  ),
                ),
                Text(
                  "주문번호: B0T301NQ",
                  style: TextStyle(
                    color: Color.fromRGBO(177, 177, 177, 1),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "주소",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "서울특별시 성동구 사근동",
                  style: TextStyle(
                    color: Color.fromRGBO(177, 177, 177, 1),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 33),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "수거일정",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "2022년 10월 14일 (금)",
                  style: TextStyle(
                    color: Color.fromRGBO(177, 177, 177, 1),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 33),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "수선 요청사항",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "밑단 포인트 살려주세요",
                  style: TextStyle(
                    color: Color.fromRGBO(177, 177, 177, 1),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const Divider(),
            const Spacer(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("총 수선금액"),
                    Text("12,000원"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("배달팁"),
                    Text("3,000원"),
                  ],
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("총 결제금액"),
                Text("15,000원"),
              ],
            ),
            const Text("2022년 11월 17일 완료 예상"),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.offNamedUntil(
                      Routes.DEPOSIT_INFO,
                      ModalRoute.withName(Routes.MAIN),
                    ),
                    child: const Text("15,000원 결제하기"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 17),
          ],
        ),
      ),
    );
  }
}
