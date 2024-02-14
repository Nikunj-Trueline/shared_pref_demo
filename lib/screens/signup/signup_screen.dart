import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_pref_demo/common/snackbar_common.dart';
import 'package:shared_pref_demo/screens/signin/signin_screen.dart';
import 'package:shared_pref_demo/screens/signup/components/signup_common.dart';
import 'package:shared_pref_demo/service/prefrence_string.dart';
import 'package:shared_pref_demo/service/servicies.dart';
import '../../common/colors.dart';
import '../../common/common_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
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
                    height: 150,
                  ),
                  const Center(
                    child: Text(
                      'S I G N U P   S C R E E N',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 130),
                  Row(
                    children: [
                      Expanded(
                        child: commonTextFiled(
                          controller: _fNameController,
                          labelText: "FNAME",
                          left: 15,
                          right: 7,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: commonTextFiled(
                          controller: _lNameController,
                          labelText: "LNAME",
                          left: 7,
                          right: 15,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  commonTextFiled(
                    controller: _contactController,
                    labelText: "CONTACT NO",
                    left: 15,
                    right: 15,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  commonTextFiled(
                    controller: _emailController,
                    labelText: "EMAIL",
                    left: 15,
                    right: 15,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  commonTextFiled(
                    controller: _passwordController,
                    labelText: "PASSWORD",
                    left: 15,
                    right: 15,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  elevatedButtonForSignup(onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        onTapSignUp();
                      });
                    }
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> onTapSignUp() async {
    String data =
        PreferenceServices.getStringData(key: PreferenceStrings.userKey);

    List userData = [];

    if (data != "") {
      userData = jsonDecode(data);
      userData.add({
        "fName": _fNameController.text,
        "lName": _lNameController.text,
        "contactNo": _contactController.text,
        "email": _emailController.text,
        "password": _passwordController.text
      });
    } else {
      userData.add({
        "fName": _fNameController.text,
        "lName": _lNameController.text,
        "contactNo": _contactController.text,
        "email": _emailController.text,
        "password": _passwordController.text
      });
    }

    String data1 = jsonEncode(userData);


    if (!context.mounted) return;
    snackBarCommon(text: "DATA REGISTER", context: context);

    if (!context.mounted) return;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
        (route) => false);
  }
}
