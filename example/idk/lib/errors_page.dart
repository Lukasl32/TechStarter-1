import 'package:flutter/material.dart';
import 'package:idk/test.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<String> errors = [
    "Chyba 1",
    "Chyba 2",
    "Chyba 3",
    "Chyba 4",
    "Chyba 5",
    "Chyba 6"
  ];

  void readAllErrors() async {
    open();
    var items = await readDatabase();
    print(items);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          onPressed: readAllErrors,
          child: Text("Načíst chyby"),
        ),
      ],
    );
  }
}
