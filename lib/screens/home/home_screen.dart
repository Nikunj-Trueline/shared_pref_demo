import 'package:flutter/material.dart';
import 'package:shared_pref_demo/common/colors.dart';
import 'package:shared_pref_demo/common/snackbar_common.dart';
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


  @override
  void initState() {
    getAllData();
    super.initState();
  }

  void getAllData() {

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
                    itemCount: 10,
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
                                title: const Text("FNAME : ",
                                    style: cardTextStyle),
                                subtitle: const Text(
                                    "LNAME :",
                                    style: cardTextStyle),
                                leading: const CircleAvatar(
                                  radius: 33,
                                  backgroundColor: Colors.deepPurple,
                                  child: Text(
                                   "",
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
                              const Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: Text("EMAIL : ",
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
