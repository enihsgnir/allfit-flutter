import 'package:flutter/material.dart';

class ConditionalParentWidget extends StatelessWidget {
  final bool condition;
  final TransitionBuilder parentBuilder;
  final Widget child;

  const ConditionalParentWidget({
    super.key,
    required this.condition,
    required this.parentBuilder,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return condition ? parentBuilder(context, child) : child;
  }
}
