import 'package:coccidiosisdetection_app/app.dart';
import 'package:coccidiosisdetection_app/app_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: AppProviders.providers,
    child: const MainApp(),
  ));
}
