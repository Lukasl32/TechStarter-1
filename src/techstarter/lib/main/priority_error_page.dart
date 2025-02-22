import 'package:flutter/material.dart';
import 'package:gui/custom_widgets/custom_button.dart';
import 'package:gui/main.dart';

class PriorityErrorPage extends StatefulWidget {
  const PriorityErrorPage({super.key});

  @override
  State<PriorityErrorPage> createState() => _PriorityErrorPageState();
}

class _PriorityErrorPageState extends State<PriorityErrorPage> {
  @override
  Widget build(BuildContext context) {
    return CustomCardPrioriteDefect(
      defectTitle: "Пошкоджений малюнок протектора",
      defectTitleCzech: "protlačené vyhazovače",
    );

    /*return Center(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(4, (index) {
          return CustomCardPrioriteDefect(defectTitle: "Titul defektu");
        }),
      ),
    );*/
  }
}

class CustomCardPrioriteDefect extends StatelessWidget {
  const CustomCardPrioriteDefect({super.key, required this.defectTitle, this.defectTitleCzech});

  final String defectTitle;
  final String? defectTitleCzech;

  final Color _backgroundColor = const Color.fromARGB(255, 120, 120, 120);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 500,
      height: 250,
      //color: Colors.amber,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: _backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3,
            spreadRadius: 3,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 10),
              Text(
                "50x",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Column(
                children: [
                  Container(
                    width: 380,
                    child: Text(
                      defectTitle,
                      style: TextStyle(fontSize: (defectTitle.length < 20 ? 30 : 25), fontWeight: FontWeight.bold,),
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text((defectTitleCzech == null ? "" : defectTitleCzech!)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Divider(
                      height: 25,
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              CustomButtonForPriorityList(
                btnOnTap: () {},
                btnColor: Colors.green,
                btnIcon: Icons.add,
              ),
              Spacer(),
              CustomButtonForPriorityList(
                btnOnTap: () {},
                btnColor: Colors.red,
                btnIcon: Icons.remove,
              ),
              Spacer(),
            ],
          ),
          Spacer(),
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

/*
Center(
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
                CustomButtonPrioriteDefect(),
                _buildButton("Most used"),
                _buildButton("Most used"),
                _buildButton("Most used"),
              ],
            ),
          ),
        ],
      ),
    );
 */
