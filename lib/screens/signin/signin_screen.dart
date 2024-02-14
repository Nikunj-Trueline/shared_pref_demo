import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_pref_demo/common/snackbar_common.dart';
import 'package:shared_pref_demo/screens/home/home_screen.dart';
import 'package:shared_pref_demo/screens/signin/components/signin_common.dart';
import 'package:shared_pref_demo/screens/signup/signup_screen.dart';
import 'package:shared_pref_demo/service/prefrence_string.dart';
import 'package:shared_pref_demo/service/servicies.dart';
import '../../common/colors.dart';
import '../../common/common_widget.dart';
import '../../common/string_constant.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: ColorsClass.gradientForBackground,
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  const Center(
                    child: Text(
                      signInBackground,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 130),
                  commonTextFiled(
                    left: 20,
                    right: 20,
                    controller: _emailController,
                    labelText: "EMAIL",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(right: 4, top: 1, bottom: 1),
                      child: Icon(
                        Icons.email,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  commonTextFiled(
                    controller: _passwordController,
                    left: 20,
                    right: 20,
                    labelText: "PASSWORD",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(right: 4, top: 1, bottom: 1),
                      child: Icon(
                        Icons.visibility_off,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  elevatedButtonForSignIn(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          onTapSignIn();
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  customRowForSignIn(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ));
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

 void onTapSignIn() async {
    String data =
        PreferenceServices.getStringData(key: PreferenceStrings.userKey);

    if (data != "") {
      List userData = [];

      userData = jsonDecode(data);

      bool user = userData.any((element) =>
          element["email"] == _emailController.text &&
          element["password"] == _passwordController.text);

         if(user)
           {
             PreferenceServices.setData(key: PreferenceStrings.loginKey, value: true);
            if (!context.mounted) return;
             snackBarCommon(text: "You are login successfully", context: context);
             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(),),(route) => false,);
           }
         else
           {
             snackBarCommon(text: "Enter valid email password", context: context);
           }
    }
    else {
      snackBarCommon(text: "Data not found", context: context);
    }
  }
}
