import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const DefaultAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: Get.back,
        icon: const Icon(
          CupertinoIcons.chevron_back,
          size: 32,
          color: Colors.black,
        ),
      ),
      title: title == null
          ? null
          : Text(
              title!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
