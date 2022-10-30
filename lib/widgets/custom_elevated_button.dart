import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double height;
  final Color? backgroundColor;
  final bool isActiveIf;
  final VoidCallback? onPressed;
  final Widget child;

  const CustomElevatedButton({
    super.key,
    this.height = 44,
    this.backgroundColor,
    this.isActiveIf = true,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isActiveIf ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: child,
      ),
    );
  }
}
