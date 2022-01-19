import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_node/UI/get_weight_history.dart';
import 'package:flutter_node/UI/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UI/login.dart';

Future<void> main() async {
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // String? user =prefs.getString('email')?? "";
String user= "";
  runApp(MyApp(user));
}

class MyApp extends StatefulWidget {
  String? user;

  MyApp(this.user, {Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    print(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Weight App',
      theme: ThemeData(
          //This is the default font, overrideable with fontFamily property
          ),
      home:widget.user!.isNotEmpty ? const Login() :const SignUp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
