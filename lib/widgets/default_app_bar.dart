import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget defaultAppBar() {
  return AppBar(
    leading: IconButton(
      onPressed: Get.back,
      icon: const Icon(
        CupertinoIcons.chevron_back,
        size: 32,
        color: Colors.black,
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}
