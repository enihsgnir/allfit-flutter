import 'package:allfit_flutter/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool enableDrawer;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.title,
    this.enableDrawer = false,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        splashRadius: 24,
        onPressed: () {
          if (enableDrawer) {
            Scaffold.of(context).openDrawer();
          } else {
            Navigator.of(context).pop();
          }
        },
        icon: Icon(
          enableDrawer ? Icons.menu : CupertinoIcons.chevron_back,
          size: 32,
          color: Colors.black,
        ),
      ),
      title: title.andThen((value) {
        return Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        );
      }),
      actions: actions,
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
