import 'package:flutter/material.dart';
import '../../../common/common_widget.dart';

Widget loginTextFiled({
  Widget? suffixIcon,
  Widget? prefixIcon,
  required String hintText,
  bool obscureText = false,
  required TextEditingController controller,
  String? labelText,
  required String? Function(String?)? validator,
}) {
  return commonTextFiled(
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    hintText: hintText,
    obscureText: obscureText,
    controller: controller,
    labelText: labelText,
    validator: validator,
  );
}

Widget elevatedButtonForSignIn({required Function() onPressed}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fixedSize: const Size(380, 60),
      elevation: 10,
      shadowColor: Colors.black,
      backgroundColor: Colors.deepPurple.shade400,
    ),
    onPressed: onPressed,
    child: const Text('S I G N - I N',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
        )),
  );
}

Widget customRowForSignIn({required void Function() onPressed}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      const Text(
        "Don't have Account?",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 5),
        child: TextButton(
          onPressed: onPressed,
          child: const Text(
            "REGISTER NOW",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
    ],
  );
}
