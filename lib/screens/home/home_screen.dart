import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_pref_demo/common/colors.dart';
import 'package:shared_pref_demo/common/snackbar_common.dart';
import 'package:shared_pref_demo/model/user_model.dart';
import 'package:shared_pref_demo/screens/home/components/textstyle_common.dart';
import 'package:shared_pref_demo/screens/signin/signin_screen.dart';
import 'package:shared_pref_demo/service/prefrence_string.dart';
import 'package:shared_pref_demo/service/servicies.dart';
import '../../common/common_widget.dart';
import '../../common/string_constant.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<UserData> userData1 = [];

  @override
  void initState() {
    getAllData();
    super.initState();
  }

  void getAllData() {
    String userDataString =  PreferenceServices.getStringData(key: PreferenceStrings.userKey);


    if(userDataString!="")
      {
        userData1 =   userDataFromJson(userDataString);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration:
                BoxDecoration(gradient: ColorsClass.gradientForBackground),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 75,
                ),
                const Text(homeScreen, style: headingTextStyle),
                SizedBox(
                  height: 1000,
                  child: ListView.builder(
                    itemCount: userData1.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          bottom: 20,
                        ),
                        child: Container(
                          decoration: commonBoxDecorationForHome(),
                          height: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Colors.black87, width: 2),
                                    borderRadius: BorderRadius.circular(10)),
                                title:  Text("FNAME : ${userData1[index].fName}",
                                    style: cardTextStyle),
                                subtitle:  Text(
                                    "LNAME : ${userData1[index].lName}",
                                    style: cardTextStyle),
                                leading:  CircleAvatar(
                                  radius: 33,
                                  backgroundColor: Colors.deepPurple,
                                  child: Text(
                                   "${userData1[index].fName![0].toUpperCase()}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24),
                                  ),
                                ),
                                trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.delete,
                                      size: 30,
                                      color: Colors.black,
                                    )),
                              ),
                               Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: Text("EMAIL : ${userData1[index].email}",
                                    style: cardTextStyle),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple.shade600,
        onPressed: () {
          onTapLogOut();
        },
        child: const Icon(
          Icons.logout,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  void onTapLogOut()  {
    PreferenceServices.setData(key: PreferenceStrings.loginKey, value: false);
    snackBarCommon(text: "Logout scuccesfully", context: context);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignInScreen(),), (route) => false);
  }
}
