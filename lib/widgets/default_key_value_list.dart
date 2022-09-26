import 'package:flutter/material.dart';

class DefaultKeyValueList extends StatelessWidget {
  final Map<String, String> data;
  final double interval;
  final TextStyle keyStyle;
  final TextStyle valueStyle;

  const DefaultKeyValueList({
    super.key,
    required this.data,
    required this.interval,
    required this.keyStyle,
    required this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
