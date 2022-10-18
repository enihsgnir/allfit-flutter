import 'package:flutter/material.dart';

class CustomTopPadding extends StatelessWidget {
  final double? top;
  final bool addStatusBarHeight;
  final bool addAppbarHeight;

  const CustomTopPadding({
    super.key,
    this.top,
    this.addStatusBarHeight = false,
    this.addAppbarHeight = false,
  });

  @override
  Widget build(BuildContext context) {
    double height = top ?? 32;
    if (addStatusBarHeight) {
      height += MediaQuery.of(context).padding.top;
    }
    if (addAppbarHeight) {
      height += kToolbarHeight;
    }

    return SizedBox(height: height);
  }
}

class CustomBottomPadding extends StatelessWidget {
  final double? bottom;

  const CustomBottomPadding({
    super.key,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: bottom ?? 32);
  }
}
