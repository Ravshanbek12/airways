import 'package:airways/ui/login/login_screen.dart';
import 'package:airways/ui/splash/splash_screen.dart';
import 'package:airways/ui/tab_box/products/products_screen.dart';
import 'package:flutter/material.dart';

import 'data/local/storagea_repository.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();

  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
