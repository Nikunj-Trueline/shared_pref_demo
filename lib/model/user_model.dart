// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

List<UserData> userDataFromJson(String str) => List<UserData>.from(json.decode(str).map((x) => UserData.fromJson(x)));

String userDataToJson(List<UserData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserData {
  String? email;
  String? password;
  String? fName;
  String? lName;
  String? contactNo;

  UserData({
    this.email,
    this.password,
    this.fName,
    this.lName,
    this.contactNo,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      email: json["email"],
      password: json["password"],
      fName: json["fName"],
      lName: json["lName"],
      contactNo: json["contactNo"],
    );
  }

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "fName": fName,
    "lName": lName,
    "contactNo": contactNo,
  };
}
