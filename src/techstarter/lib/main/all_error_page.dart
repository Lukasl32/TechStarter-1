import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gui/custom_widgets/custom_button.dart';
import 'package:gui/database_controller.dart';
import 'package:gui/main.dart';

class AllErrorPage extends StatefulWidget {
  const AllErrorPage({super.key});

  @override
  State<AllErrorPage> createState() => _AllErrorPageState();
}

class _AllErrorPageState extends State<AllErrorPage> {
  List defects = [
    Defect(1, 011552, "Nějaký název1", "Detailní popisek", true, Product(20)),
    Defect(2, 026502, "Nějaký název2", "Detailní popisek", true, Product(20)),
    Defect(3, 021252, "Nějaký název3", "Detailní popisek", true, Product(20)),
    Defect(4, 025825, "Nějaký název4", "Detailní popisek", true, Product(20)),
  ];

  @override
  void initState() {
    super.initState();
    // TODO: Fetch defects from database
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        ErrorItem(),
        ErrorItemNew(),
        /* for (Defect defect in defects)
          ErrorNewItem(
            defect: defect,
          ), */
      ],
    );
  }
}

class CustomDefectListCard extends StatefulWidget {
  CustomDefectListCard({super.key, required this.defect});

  Defect defect;

  //final String defectTitle;
  //final String defectTitleCzech;
  //int defectCount;

  @override
  State<CustomDefectListCard> createState() => _CustomDefectListCardState();
}

class _CustomDefectListCardState extends State<CustomDefectListCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Adds a slight shadow for better contrast
      color: baseColor2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // "yapayapa" text with bigger size and bold weight
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.defect.name,
                  style: TextStyle(
                    fontSize: 25, // Increased font size
                    fontWeight: FontWeight.bold, // Made text bold
                  ),
                ),
                Text(
                  widget.defect.description,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              widget.defect.number.toString(),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 40),
            CustomButtonForList(
              btnOnTap: () {},
              btnIcon: Icons.add,
              btnColor: Colors.green,
            ),
            SizedBox(width: 10),
            //FilledButton(onPressed: () {}, child: Text("Odebrat")),
            CustomButtonForList(
              btnOnTap: () {},
              btnIcon: Icons.remove,
              btnColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorItemNew extends StatelessWidget {
  const ErrorItemNew({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Adds a slight shadow for better contrast
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // "yapayapa" text with bigger size and bold weight
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Toto je text v ukrajinštině",
                  style: TextStyle(
                    fontSize: 25, // Increased font size
                    fontWeight: FontWeight.bold, // Made text bold
                  ),
                ),
                Text(
                  "Toto je text v češtině",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              "3",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 40),
            CustomButtonForList(
              btnOnTap: () {},
              btnIcon: Icons.add,
              btnColor: Colors.green,
            ),
            SizedBox(width: 10),
            //FilledButton(onPressed: () {}, child: Text("Odebrat")),
            CustomButtonForList(
              btnOnTap: () {},
              btnIcon: Icons.remove,
              btnColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorItem extends StatefulWidget {
  const ErrorItem({
    super.key,
    //required this.defect,
  });

  //final Defect defect;

  @override
  State<ErrorItem> createState() => _ErrorItemState();
}

class _ErrorItemState extends State<ErrorItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            //Text(widget.defect.name),
            Spacer(),
            Text("0"),
            SizedBox(width: 50),
            //FilledButton(onPressed: (){}, child: Text("Přidat")),
            CustomButtonForList(
              btnOnTap: () {
                // abs: updateRecord(number + 1)
                // abs: fetchDefects()
                setState(() {});
              },
              btnIcon: Icons.add,
              btnColor: Colors.green,
            ),
            SizedBox(width: 10),
            //FilledButton(onPressed: () {}, child: Text("Odebrat")),
            CustomButtonForList(
              btnOnTap: () {
                // abs: updateRecord(number - 1)
                // abs: fetchDefects()
                setState(() {});
              },
              btnIcon: Icons.remove,
              btnColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
