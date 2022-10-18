import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double height;
  final bool isActiveIf;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final String text;
  final Widget? child;

  const CustomElevatedButton({
    super.key,
    this.height = 44,
    this.isActiveIf = true,
    required this.onPressed,
    this.backgroundColor,
    required this.text,
    this.child,
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
        child: child ??
            Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    );
  }
}
