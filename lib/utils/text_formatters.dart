import 'package:flutter/services.dart';

class PhoneNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (oldValue.selection.baseOffset != oldValue.text.length ||
        oldValue.selection.extentOffset != oldValue.text.length) {
      return TextEditingValue(
        text: oldValue.text,
        selection: TextSelection.collapsed(offset: oldValue.text.length),
      );
    }

    if (newValue.text.isEmpty) {
      return newValue;
    } else if (newValue.text.length > 13) {
      return oldValue;
    }

    final buffer = StringBuffer();

    if (newValue.text.length > oldValue.text.length) {
      final newText = newValue.text.replaceAll(RegExp(r"\D"), "");

      for (int i = 0; i < newText.length; i++) {
        if (i == 3 ||
            (newText.length == 10 && i == 6) ||
            (newText.length > 7 && newText.length != 10 && i == 7)) {
          buffer.write("-");
        }

        buffer.write(newText[i]);
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
