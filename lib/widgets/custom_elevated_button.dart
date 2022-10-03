import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final bool isActiveIf;
  final bool isExpanded;
  final double height;
  final Widget? child;
  final TextStyle? style;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.isActiveIf = true,
    this.isExpanded = true,
    this.height = 44,
    this.child,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 44,
            child: ElevatedButton(
              onPressed: isActiveIf ? onPressed : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
              ),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
