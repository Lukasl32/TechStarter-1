import 'package:flutter/material.dart';
import 'package:idk/errors_page.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int currentPage = 0;

  List<Widget> pages = [
    MyWidget(),
    Text("Všechny chyby"),
    Text("..."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          currentPage = index;
          setState(() {});
        },
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "images/warning.png",
              height: 50,
            ),
            label: 'Chyby top 5',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Všechny chyby',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '..',
          ),
        ],
      ),
      body: pages[currentPage],
    );
  }
}
