import 'package:flutter/material.dart';
import 'package:gui/database_controller.dart';
import 'package:gui/globals.dart' as globals;
import 'package:gui/main/main_screen.dart';
import 'package:gui/main.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'dart:typed_data';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    //readCard();
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
        const Duration(milliseconds: 200),
      ); // Asynchronní čekání, ať neblokuje UI thread
      if (data.isNotEmpty) {
        break;
      }
    }
    // 12 znakový hex string reprezentující ID karty - sloupec rfid v tabulce operators
    String cardId = String.fromCharCodes(data);
    print(cardId);
    // Přihlášení operátora podle RFID karty
    globals.operator = Operator.fetchByRfid(cardId);
    // Pokud se podařilo operátora v DB najít, přesměruje na hlavní obrazovku
    // (Proměnná mounted je jenom Flutter věc)
    if (globals.operator != null && mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background_01.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: baseColor1,
                border: Border.all(color: baseColor1, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Čekám na přiložení karty",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(height: 20), // Space between text and button

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: baseColor1,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              onPressed: () {
                // Assuming "Smith" is retrieved from the card login system
                //String loggedInSurname = "Smith";

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
                );
              },
              child: Text(
                "Login",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
