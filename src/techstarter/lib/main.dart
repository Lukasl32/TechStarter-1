import 'package:flutter/material.dart';
import 'package:gui/login/login_screen.dart';

final Color baseColor = Color.fromARGB(255, 145, 192, 33);
final Color baseColor1 = Color.fromARGB(255, 66, 66, 66);

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: LoginScreen2(),
    );
  }
}