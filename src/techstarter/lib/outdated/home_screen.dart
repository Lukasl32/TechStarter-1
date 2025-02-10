import 'package:flutter/material.dart';
import 'package:gui/main.dart';
import 'button_sheet.dart'; // Import ButtonSheet screen

class HomeScreenOld extends StatelessWidget {
  final String userSurname;
  final String userName;

  HomeScreenOld({required this.userSurname, required this.userName});

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
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward, color: Colors.black), // Arrow icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ButtonSheetOld()),
              );
            },
          ),
        ],
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
              SizedBox(height: 20), // Space between text and buttons

              // 2x2 Button Grid Layout
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40), // Moves buttons away from edges
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2, // 2 buttons per row
                  crossAxisSpacing: 20, // More horizontal space
                  mainAxisSpacing: 20, // More vertical space
                  childAspectRatio: 3, // Slightly smaller width for buttons
                  children: [
                    _buildButton("Most used"),
                    _buildButton("Most used"),
                    _buildButton("Most used"),
                    _buildButton("Most used"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 145, 192, 33),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Log Frame with Border
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: baseColor1, // Dark background
                  border: Border.all(color: baseColor1, width: 2),
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: Text(
                  "Log: $userSurname", // Display surname
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Button for "Most used"
  Widget _buildButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: baseColor1, // Dark grey color
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded shape
        ),
      ),
      onPressed: () {
        // Add button action here
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22, // Bigger font size
          fontWeight: FontWeight.bold, // Bold text for better visibility
        ),
      ),
    );
  }
}

