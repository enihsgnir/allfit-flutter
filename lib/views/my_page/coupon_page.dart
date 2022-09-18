import 'package:allfit_flutter/constants/colors.dart';
import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: "쿠폰 등록하기"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextField(),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("등록"),
                ),
              ],
            ),
            Text(
              "사용 가능한 쿠폰이 없습니다.",
              style: TextStyle(
                color: greyPointColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
