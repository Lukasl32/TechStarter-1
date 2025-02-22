import 'package:flutter/material.dart';
import 'package:gui/login/login_screen.dart';

const Color baseColor = Color.fromARGB(255, 145, 192, 33);
const Color baseColor1 = Color.fromARGB(255, 66, 66, 66);
const Color baseColor2 = Color(0xFFf7f2fa);

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

/*
Kusy vyrobené strojem
aktuálně vyráběný prvek (kód)
počet celkem žádaných kusů
počet celkem vyrobených kusů
počet kusů vyrobených strojem
počet kusů označených vadou celkem
počet kusů označený vadou na stroji


U vad mít fotku chyby

U vícejazyčných chyb mít primární jazyk velkým textem ale zároveň malý text bude mít česky jazyk kvůli mistrům

https://www.youtube.com/results?search_query=nvsp+manta

67 terminalů 1,5M
7 mobilních

*/