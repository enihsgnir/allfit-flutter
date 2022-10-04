import 'package:allfit_flutter/widgets/conditional_parent_widget.dart';
import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';

class CustomKeyValueList extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final double? keyWidth;
  final double interval;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle? keyStyle;
  final TextStyle? valueStyle;
  final Map<String, String> data;

  const CustomKeyValueList({
    super.key,
    required this.mainAxisAlignment,
    this.keyWidth,
    required this.interval,
    this.leading,
    this.trailing,
    this.keyStyle,
    this.valueStyle,
    required this.data,
  }) : assert(
          (mainAxisAlignment == MainAxisAlignment.start && keyWidth != null) ||
              mainAxisAlignment == MainAxisAlignment.spaceBetween,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data.entries
          .map<Widget>((e) {
            return Row(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConditionalParentWidget(
                  condition: mainAxisAlignment == MainAxisAlignment.start,
                  parentBuilder: (context, child) {
                    return SizedBox(
                      width: keyWidth,
                      child: child,
                    );
                  },
                  child: Text(
                    e.key,
                    style: keyStyle,
                  ),
                ),
                Expanded(
                  child: Text(
                    e.value,
                    style: valueStyle,
                    textAlign: mainAxisAlignment == MainAxisAlignment.start
                        ? TextAlign.start
                        : TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ],
            );
          })
          .intersperse(SizedBox(height: interval))
          .toList(),
    );
  }
}
