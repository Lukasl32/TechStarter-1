import 'package:flutter/material.dart';
import 'package:gui/custom_widgets/custom_button.dart';

class AllErrorPage extends StatefulWidget {
  const AllErrorPage({super.key});

  @override
  State<AllErrorPage> createState() => _AllErrorPageState();
}

class _AllErrorPageState extends State<AllErrorPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(10), children: [
      ErrorItem(),
      ErrorItem(),
      ErrorItemNew(),
    ]);
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
            CustomButton(
              btnOnTap: () {},
              btnIcon: Icons.add,
              btnColor: Colors.green,
            ),
            SizedBox(width: 10),
            //FilledButton(onPressed: () {}, child: Text("Odebrat")),
            CustomButton(
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

class ErrorItem extends StatelessWidget {
  const ErrorItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text("Název chyby"),
            Spacer(),
            Text("0"),
            SizedBox(width: 50),
            //FilledButton(onPressed: (){}, child: Text("Přidat")),
            CustomButton(
              btnOnTap: () {},
              btnIcon: Icons.add,
              btnColor: Colors.green,
            ),
            SizedBox(width: 10),
            //FilledButton(onPressed: () {}, child: Text("Odebrat")),
            CustomButton(
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
