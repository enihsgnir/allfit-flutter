import 'package:flutter/material.dart';

class TopPadding extends StatelessWidget {
  final double? top;

  const TopPadding({
    super.key,
    this.top,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: top ?? 32);
  }
}

class BottomPadding extends StatelessWidget {
  final double? bottom;

  const BottomPadding({
    super.key,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: bottom ?? 16);
  }
}
