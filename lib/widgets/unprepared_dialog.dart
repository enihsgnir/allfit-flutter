import 'package:flutter/material.dart';

Future<void> showUnpreparedDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("준비 중입니다."),
          ],
        ),
      );
    },
  );
}
