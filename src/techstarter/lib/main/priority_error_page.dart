import 'package:flutter/material.dart';
import 'package:gui/main.dart';

class PriorityErrorPage extends StatefulWidget {
  const PriorityErrorPage({super.key});

  @override
  State<PriorityErrorPage> createState() => _PriorityErrorPageState();
}

class _PriorityErrorPageState extends State<PriorityErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
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