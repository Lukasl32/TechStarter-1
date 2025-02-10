import 'package:flutter/material.dart';
import 'package:gui/main.dart';
import 'home_screen.dart'; // Import the home screen

class MyAppOld extends StatefulWidget {
  const MyAppOld({super.key});

  @override
  State<MyAppOld> createState() => _MyAppOldState();
}

class _MyAppOldState extends State<MyAppOld> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 145, 192, 33),
        elevation: 4,
        centerTitle: true,
        title: Image.asset(
          "assets/sigmaplast (1).png",
          height: 75,
        ),
      ),
      body: Container(
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
                  color: Color.fromARGB(255, 66, 66, 66),
                  border: Border.all(color: Color.fromARGB(255, 66, 66, 66), width: 2),
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
                  backgroundColor: Color.fromARGB(255, 66, 66, 66),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  // Assuming "Smith" is retrieved from the card login system
                  String loggedInSurname = "Smith";

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreenOld(userSurname: loggedInSurname, userName: '',),
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
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 145, 192, 33),
      ),
    );
  }
}
