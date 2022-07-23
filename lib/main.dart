import 'package:allfit_flutter/routes/pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString("google_fonts/OFL.txt");
    yield LicenseEntryWithLineBreaks(["google_fonts"], license);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        backgroundColor: const Color(0xFFF5F5F5),
        fontFamily: "NotoSansKR",
      ),
      initialRoute: Routes.MAIN,
      getPages: Pages.routes,
    );
  }
}
