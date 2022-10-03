import 'package:flutter/material.dart';

class CustomTopPadding extends StatelessWidget {
  final double? top;

  const CustomTopPadding({
    super.key,
    this.top,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: top ?? 32);
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
    return SizedBox(height: bottom ?? 16);
  }
}
