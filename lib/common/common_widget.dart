import 'package:flutter/material.dart';
import 'colors.dart';

AppBar commonAppBar({
  required String title,
  bool? centerTitle,
  Color? backgroundColor,
  Color? foregroundColor,
  void Function()? addIconOnPressed,
  void Function()? logOutIconOnPressed,
  IconData? iconAdd,
  IconData? iconLogOut,
}) {
  return AppBar(
    elevation: 8,
    shadowColor: Colors.deepPurple.shade300,
    title:
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 26)),
    centerTitle: centerTitle,
    foregroundColor: foregroundColor,
    backgroundColor: backgroundColor,
    actions: [
      IconButton(
        onPressed: addIconOnPressed,
        icon: Icon(iconAdd),
      ),
      IconButton(
        onPressed: logOutIconOnPressed,
        icon: Icon(iconLogOut),
      ),
    ],
  );
}

Widget commonTextFiled({
  String? hintText,
  String? labelText,
  bool obscureText = false,
  Widget? prefixIcon,
  Widget? suffixIcon,
  double left = 0.0,
  double right = 0.0,
  required TextEditingController controller,
  String? Function(String?)? validator,
}) {
  return Padding(
    padding: EdgeInsets.only(left: left, right: right),
    child: TextFormField(
      style: const TextStyle(fontSize: 22, color: Colors.black),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsClass.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
      controller: controller,
      validator: validator,
    ),
  );
}

Widget heightSizeBox({double? height}) {
  return SizedBox(
    height: height,
  );
}

Widget widthSizeBox({double? width}) {
  return SizedBox(
    height: width,
  );
}

Widget commonBtn({
  required void Function()? onPressed,
  required String data,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(data),
  );
}

Decoration commonBoxDecorationForHome() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      gradient: ColorsClass.gradientForBackground1,
      boxShadow: const [
        BoxShadow(
          offset: Offset(5, 5),
          color: Colors.white10,
          blurRadius: 10,
        )
      ]);
}
