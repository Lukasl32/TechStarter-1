import 'package:flutter/material.dart';
import 'package:gui/main/all_error_page.dart';
import 'package:gui/main/priority_error_page.dart';
import 'package:gui/main.dart';
import 'package:gui/main/status_data_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final double _groupAligment = 0.0;
  final NavigationRailLabelType _labelType = NavigationRailLabelType.all;

  final List<Widget> _pages = [
    PriorityErrorPage(),
    AllErrorPage(),
    StatusDataPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            groupAlignment: _groupAligment,
            labelType: _labelType,
            backgroundColor: baseColor,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('Prioritní'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Všechny'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Status'),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                //Container(color: Colors.blue),
                //Image.asset("assets/sigmaplast (1).png"),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/background_02.PNG"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                _pages[_selectedIndex],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
