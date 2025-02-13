import 'package:flutter/material.dart';
import 'package:gui/login/login_page.dart';
import 'package:gui/main.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        elevation: 4,
        centerTitle: true,
        title: Image.asset(
          "assets/sigmaplast (1).png",
          height: 75,
        ),
      ),
      body: LoginPage(),
      bottomNavigationBar: BottomAppBar(
        color: baseColor,
      ),
    );
  }
}
