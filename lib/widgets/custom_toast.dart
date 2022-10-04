import 'package:fluttertoast/fluttertoast.dart';

Future<void> showCustomToast(String message) async {
  await Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.BOTTOM,
    fontSize: 14,
    toastLength: Toast.LENGTH_SHORT,
  );
}
