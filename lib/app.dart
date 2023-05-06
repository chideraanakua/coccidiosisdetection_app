import 'package:coccidiosisdetection_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ignore: unused_import
import 'widget/coccidiosis_recogniser.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return GetMaterialApp(
      title: 'Coccidiosis Diagnosis',
      theme: ThemeData.dark(),
      // home: const CoccidiosisRecogniser(),
      home:const SplashScreen() ,
      debugShowCheckedModeBanner: false,
    );
  }
}
