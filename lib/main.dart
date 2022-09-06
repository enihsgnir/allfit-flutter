import 'dart:async';

import 'package:allfit_flutter/firebase_options.dart';
import 'package:allfit_flutter/routes/pages.dart';
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
