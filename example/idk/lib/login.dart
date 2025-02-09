import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int? uid;
  void loop() {
    while (true) {
      //uid = await readCard();
      if (uid != null) {
        Navigator.pushNamed(context, "/menu");
        break;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    loop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Čekám na přiložení karty..."),
      ),
    );
  }
}
