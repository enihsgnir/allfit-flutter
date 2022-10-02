import 'package:flutter/material.dart';

Future<void> showCustomModalBottomSheet({
  required BuildContext context,
  required Widget child,
}) async {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    builder: (context) {
      return child;
    },
  );
}
