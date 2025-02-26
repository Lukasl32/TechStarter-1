import 'package:flutter/material.dart';

class CustomTimeWidget extends StatefulWidget {
  const CustomTimeWidget({super.key});

  @override
  State<CustomTimeWidget> createState() => _CustomTimeWidgetState();
}

class _CustomTimeWidgetState extends State<CustomTimeWidget> {
  DateTime t = DateTime.now();

  @override
  void initState() {
    super.initState();
    Future.doWhile(() async {
      if (!mounted) {
        return false;
      }
      setState(() {
        t = DateTime.now();
      });
      await Future.delayed(Duration(milliseconds: 999 - t.millisecond));
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "${t.hourP}:${t.minuteP}:${t.secondP}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "${t.dayP}.${t.monthP}.${t.year}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension Parse on DateTime {
  String get hourP {
    return hour < 10 ? "0$hour" : "$hour";
  }

  String get minuteP {
    return minute < 10 ? "0$minute" : "$minute";
  }

  String get secondP {
    return second < 10 ? "0$second" : "$second";
  }

  String get dayP {
    return day < 10 ? "0$day" : "$day";
  }

  String get monthP {
    return month < 10 ? "0$month" : "$month";
  }
}
