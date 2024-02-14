import 'package:flutter/material.dart';
import 'package:shared_pref_demo/screens/splash/splash_screen.dart';
import 'package:shared_pref_demo/service/servicies.dart';
import 'common/string_constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await PreferenceServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      home: SplashScreen(),
    );
  }
}
