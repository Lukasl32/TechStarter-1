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
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        ErrorItem(),
        ErrorItem(),
      ]
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
                    CustomButton(btnOnTap: (){}, btnIcon: Icons.add, btnColor: Colors.green,),
                    SizedBox(width: 10),
                    //FilledButton(onPressed: () {}, child: Text("Odebrat")),
                    CustomButton(btnOnTap: (){}, btnIcon: Icons.remove, btnColor: Colors.red,),
                  ],
                ),
              ),
            );
  }
}