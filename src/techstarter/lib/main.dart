import 'package:flutter/material.dart';
import 'package:gui/database_controller.dart';
import 'package:gui/login/login_screen.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'dart:typed_data';
import 'package:gui/globals.dart' as globals;
import 'package:gui/main/main_screen.dart';

const Color baseColor = Color.fromARGB(255, 145, 192, 33);
const Color baseColor1 = Color.fromARGB(255, 66, 66, 66);
const Color baseColor2 = Color(0xFFf7f2fa);

int machineID = 1;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  initializeDatabase();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    //readCard(); //TODO: zapnout kvůli přikládce karet
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void readCard() async {
    await getCard();
  }

  Future getCard() async {
    SerialPort serialPort = SerialPort("/dev/ttyAMA0");
    serialPort.openRead();
    Uint8List data = Uint8List(0);
    while (true) {
      // Čtení dat z RFID čtečky, dokud se nepřiloží karta
      data = serialPort.read(12, timeout: 100);
      await Future.delayed(
        const Duration(milliseconds: 300),
      ); // Asynchronní čekání, ať neblokuje UI thread
      if (data.isNotEmpty) {
        break;
      }
    }
    // 12 znakový hex string reprezentující ID karty - sloupec rfid v tabulce operators
    String cardId = String.fromCharCodes(data);
    debugPrint(cardId);

    // Pokud byla přiložena stejná karta, která byla předtím, neřeší se
    if (globals.operator?.rfid == cardId) {
      debugPrint("Odhlašuji $cardId");
      globals.operator = null;
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => LoginScreen2(),
        ),
      );
      serialPort.close();
      return await getCard();
    }

    // Přihlášení operátora podle RFID karty
    globals.operator = Operator.fetchByRfid(cardId);
    // Pokud se podařilo operátora v DB najít, přesměruje na hlavní obrazovku
    // (Proměnná mounted je jenom Flutter věc)
    if (globals.operator != null && mounted) {
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
    }
    serialPort.close();
    return await getCard();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: true,
      showSemanticsDebugger: false,
      showPerformanceOverlay: false,
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
