import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          SizedBox(height: 40),
          Row(
            children: [
              Text(
                "1회 이용수선서비스",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "이용중",
                style: TextStyle(
                  color: Color.fromRGBO(60, 132, 240, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Text(
            "안심 정찰 가격표에 의해 요금이 부과됩니다.",
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 29),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "신청 서비스",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "1회 이용수선서비스",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 45),
          Text(
            "이용 내역",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "2022년 XX월 XX일 (X)",
              style: TextStyle(fontSize: 13),
            ),
            subtitle: Text(
              "수령 완료",
              style: TextStyle(
                color: Color.fromRGBO(60, 132, 240, 1),
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(CupertinoIcons.chevron_forward),
            contentPadding: EdgeInsets.zero,
            onTap: () {},
          ),
          Divider(),
          Text(
            "신청 서비스",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "배송지",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "XXXX",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
