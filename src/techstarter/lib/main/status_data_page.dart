import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FirstCard(commandCode: "XXXXXXXXXXX"),
                  const SizedBox(height: 8),
                  SecondCard(
                    defectsMachine: 50,
                    defectsOperator: 35,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ThirdCard(
                titles: [
                  "Žádané kusy:",
                  "Vyrobené kusy:",
                  "Celkem vyrobené kusy:",
                  "Kusy vyrobené strojem:"
                ],
                values: [
                  650,
                  650,
                  650,
                  650,
                ],
              ),
            ),
          ),
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
            Text(
              "Aktuálně vyráběný prvek:",
              style: TextStyle(
                fontSize: (30),
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              widget.commandCode,
              style: TextStyle(
                fontSize: (widget.commandCode.length < 20 ? 30 : 25),
              ),
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Kusy označené chybou
class SecondCard extends StatefulWidget {
  const SecondCard({
    super.key,
    required this.defectsMachine,
    required this.defectsOperator,
  });

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                "Defekty STROJ",
                style: TextStyle(
                  fontSize: (30),
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
              SfRadialGauge(
                axes: [
                  RadialAxis(
                    maximum: 150,
                    pointers: [
                      NeedlePointer(
                        value: widget.defectsMachine.toDouble(),
                      ),
                    ],
                    ranges: [
                      GaugeRange(
                        startValue: 0,
                        endValue: 50,
                        color: Colors.red,
                      ),
                      GaugeRange(
                        startValue: 50,
                        endValue: 100,
                        color: Colors.orange,
                      ),
                      GaugeRange(
                        startValue: 100,
                        endValue: 150,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                widget.defectsMachine.toString(),
                style: TextStyle(
                  fontSize:
                      (widget.defectsMachine.toString().length < 20 ? 30 : 25),
                ),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
            ],
          ),
          Column(
            children: [
              Text(
                "Defekty OPERÁTOR",
                style: TextStyle(
                  fontSize: (30),
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
              SfRadialGauge(
                axes: [
                  RadialAxis(
                    maximum: 150,
                    pointers: [
                      NeedlePointer(
                        value: widget.defectsOperator.toDouble(),
                      ),
                    ],
                    ranges: [
                      GaugeRange(
                        startValue: 0,
                        endValue: 50,
                        color: Colors.red,
                      ),
                      GaugeRange(
                        startValue: 50,
                        endValue: 100,
                        color: Colors.orange,
                      ),
                      GaugeRange(
                        startValue: 100,
                        endValue: 150,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                widget.defectsOperator.toString(),
                style: TextStyle(
                  fontSize:
                      (widget.defectsOperator.toString().length < 20 ? 30 : 25),
                ),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}

// Žádané kusy | Vyrobené kusy | Celkem vyrobené kusy | Kusy vyrobené strojem
class ThirdCard extends StatefulWidget {
  const ThirdCard({super.key, required this.titles, required this.values});

  final List<String> titles;
  final List<int> values;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < widget.titles.length; i++) ...[
              Text(
                widget.titles[i],
                style: TextStyle(
                  fontSize: (widget.titles[i].length < 20 ? 25 : 20),
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                widget.values[i].toString(),
                style: TextStyle(
                  fontSize: (30),
                ),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
              const Divider(),
            ],
          ],
        ),
      ),
    );
  }
}
