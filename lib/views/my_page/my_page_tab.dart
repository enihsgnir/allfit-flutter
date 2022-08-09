import 'package:allfit_flutter/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageTab extends StatelessWidget {
  const MyPageTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
            ),
            Text("XXX님"),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.abc),
                ),
                Text("쿠폰"),
              ],
            ),
          ],
        ),
        Divider(),
        ListTile(
          title: Text("이용 중인 서비스"),
          trailing: Icon(CupertinoIcons.chevron_forward),
          onTap: () {},
        ),
        Container(
          height: 9,
          color: backgroundColor,
        ),
        ListTile(
          title: Text("친구 초대하기"),
          trailing: Icon(CupertinoIcons.chevron_forward),
          onTap: () {},
        ),
        ListTile(
          title: Text("공지사항"),
          trailing: Icon(CupertinoIcons.chevron_forward),
          onTap: () {},
        ),
        ListTile(
          title: Text("설정"),
          trailing: Icon(CupertinoIcons.chevron_forward),
          onTap: () {},
        ),
        Text("고객센터"),
        ListTile(
          title: Text("자주 묻는 질문"),
          onTap: () {},
        ),
        ListTile(
          title: Text("1:1 문의하기"),
          onTap: () {},
        ),
      ],
    );
  }
}
