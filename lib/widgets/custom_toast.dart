import 'package:fluttertoast/fluttertoast.dart';

Future<void> showCustomToast(String msg) async {
  await Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    fontSize: 14,
    toastLength: Toast.LENGTH_SHORT,
  );
}
