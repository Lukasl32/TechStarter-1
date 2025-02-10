import 'package:flutter/material.dart';

class ButtonSheetOld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 145, 192, 33),
        elevation: 4,
        centerTitle: true,
        title: Text("Options", style: TextStyle(color: Colors.white, fontSize: 20)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Back arrow
          onPressed: () {
            Navigator.pop(context); // Navigate back to HomeScreen
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/sigmaplast (2).png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2, // 2 buttons per row
            crossAxisSpacing: 20, // More horizontal space
            mainAxisSpacing: 20, // More vertical space
            childAspectRatio: 3, // Slightly smaller width for buttons
            children: [
              _buildButton("Option 1"),
              _buildButton("Option 2"),
              _buildButton("Option 3"),
              _buildButton("Option 4"),
              _buildButton("Option 5"),
              _buildButton("Option 6"),
              _buildButton("Option 7"),
              _buildButton("Option 8"),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 66, 66, 66),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        // Add functionality here
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
