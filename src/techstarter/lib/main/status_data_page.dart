import 'package:flutter/material.dart';

class StatusDataPage extends StatefulWidget {
  const StatusDataPage({super.key});

  @override
  State<StatusDataPage> createState() => _StatusDataPageState();
}

class _StatusDataPageState extends State<StatusDataPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        spacing: 40,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FirstCard(commandCode: "XXXXXXXXXXX"),
              SecondCard(
                defectsMachine: 50,
                defectsOperator: 35,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ThirdCard(title: "Žádané kusy:", value: 650),
              ThirdCard(title: "Vyrobené kusy:", value: 650),
              ThirdCard(title: "Celkem vyrobené kusy:", value: 650),
              ThirdCard(title: "Vyrobené za 24h:", value: 650),
            ],
          )
        ],
      ),
    );
  }
}

// Aktuálně vyráběný
class FirstCard extends StatefulWidget {
  const FirstCard({super.key, required this.commandCode});

  final String commandCode;

  @override
  State<FirstCard> createState() => _FirstCardState();
}

class _FirstCardState extends State<FirstCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text("Aktuálně vyráběný prvek:",
                style: TextStyle(
                  fontSize: (30),
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center),
            Text(widget.commandCode,
                style: TextStyle(
                  fontSize: (widget.commandCode.length < 20 ? 30 : 25),
                ),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

// Kusy označené chybou
class SecondCard extends StatefulWidget {
  const SecondCard({super.key, required this.defectsMachine, required this.defectsOperator});

  final int defectsMachine;
  final int defectsOperator;

  @override
  State<SecondCard> createState() => _SecondCardState();
}

class _SecondCardState extends State<SecondCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text("Defekty STROJ:",
                    style: TextStyle(
                      fontSize: (30),
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center),
                Text(widget.defectsMachine.toString(),
                    style: TextStyle(
                      fontSize: (widget.defectsMachine.toString().length < 20 ? 30 : 25),
                    ),
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center),

                Text("Defekty OPERÁTOR:",
                    style: TextStyle(
                      fontSize: (30),
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center),
                Text(widget.defectsOperator.toString(),
                    style: TextStyle(
                      fontSize: (widget.defectsOperator.toString().length < 20 ? 30 : 25),
                    ),
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}

// Žádané kusy | Vyrobené kusy | Celkem vyrobené kusy | Kusy vyrobené strojem
class ThirdCard extends StatefulWidget {
  const ThirdCard({super.key, required this.title, required this.value});

  final String title;
  final int value;

  @override
  State<ThirdCard> createState() => _ThirdCardState();
}

class _ThirdCardState extends State<ThirdCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(widget.title,
                style: TextStyle(
                  fontSize: (widget.title.length < 20 ? 25 : 20),
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center),
            Text(widget.value.toString(),
                style: TextStyle(
                  fontSize: (30),
                ),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );;
  }
}
