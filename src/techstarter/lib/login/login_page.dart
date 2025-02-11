import 'package:flutter/material.dart';
import 'package:gui/main/main_screen.dart';
import 'package:gui/main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/sigmaplast (2).png"),
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
