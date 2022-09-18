import 'dart:async';

import 'package:allfit_flutter/firebase_options.dart';
import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/utils/pages.dart';
import 'package:allfit_flutter/views/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    if (kDebugMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    }

    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString("google_fonts/OFL.txt");
      yield LicenseEntryWithLineBreaks(["google_fonts"], license);
    });

    runApp(const MyApp());
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        backgroundColor: const Color(0xFFF5F5F5),
        fontFamily: "NotoSansKR",
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: greyPointColor),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: greyPointColor),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromRGBO(30, 30, 30, 1),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: const Color.fromRGBO(30, 30, 30, 1),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
        ),
      ),
      initialRoute: MainPage.route,
      getPages: Pages.routes,
    );
  }
}
