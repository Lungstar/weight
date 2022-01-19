import 'dart:convert';
import 'package:flutter_node/core/model/user_model.dart';
import 'package:http/http.dart' as http;

Future<void> userSignIn(String email,String password) async {
  var data = {
    "email": email,
    "password": password,
  };
  String uri = "http://192.168.8.114:3000/api/login";
  try {
    var response = await http.post(Uri.parse(uri), body: data);
    var decodeBody = json.decode(response.body);
  } catch (ex) {
    print(ex);
  }
}

Future<void> userSignUp(UserModel user) async {
  String uri =
      "http://192.168.8.114:3000/api/register";
  try {
    var response = await http.post(Uri.parse(uri), body: user);
    var decodeBody = json.decode(response.body);
  } catch (ex) {
    print(ex);
  }
}