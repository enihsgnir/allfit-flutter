import 'package:flutter/material.dart';

class ExpandedElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  const ExpandedElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 44,
            child: ElevatedButton(
              onPressed: onPressed,
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

// class CustomElevatedButton extends StatelessWidget {
//   final bool isExpanded;
//   final double height;
//   final VoidCallback onPressed;
//   final Color? backgroundColor;
//   final Widget? child;
//   final String? text;
//   final TextStyle? style;

//   const CustomElevatedButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
