import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_pref_demo/common/colors.dart';
import 'package:shared_pref_demo/screens/home/home_screen.dart';
import 'package:shared_pref_demo/service/prefrence_string.dart';
import 'package:shared_pref_demo/service/servicies.dart';

import '../../common/string_constant.dart';

import '../signin/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

     bool isLogin = PreferenceServices.getBoolData(key: PreferenceStrings.loginKey);

    navigation(isLogin);
    super.initState();
  }

  navigation(bool isLogin) {
    Timer(
        const Duration(
          seconds: 5,
        ), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => isLogin ? const HomeScreen() : const SignInScreen(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: ColorsClass.splashGradient,
        ),
        child: const Center(
          child: Text(
            splashScreen,
            style: TextStyle(
                fontSize: 30,
                shadows: [
                  Shadow(
                    color: Colors.white70,
                    blurRadius: 2,
                  ),
                ],
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
