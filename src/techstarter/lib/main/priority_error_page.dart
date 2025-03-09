import 'package:flutter/material.dart';
import 'package:gui/custom_widgets/custom_button.dart';
import 'package:gui/database_controller.dart';
import 'package:gui/language_select.dart';
import 'package:gui/main.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PriorityErrorPage extends StatefulWidget {
  const PriorityErrorPage({super.key});

  @override
  State<PriorityErrorPage> createState() => _PriorityErrorPageState();
}

class _PriorityErrorPageState extends State<PriorityErrorPage> {
  /*final List<Widget> w = [
    //Wrap(children: [Container(color: Colors.red, width: 20, height: 20)]),
    //Wrap(children: [Container(color: Colors.red, width: 20, height: 20)]),
    //Wrap(children: [Container(color: Colors.red, width: 20, height: 20)]),
    //CustomDefectPrioriteListCard(defectTitle: "Пошкоджений малюнок протектора", defectTitleCzech:  "český název"),
    //CustomDefectPrioriteListCard(defectTitle: "Пошкоджений малюнок протектора", defectTitleCzech:  "český název"),
    //CustomDefectPrioriteListCard(defectTitle: "Пошкоджений малюнок протектора", defectTitleCzech:  "český název"),
    //CustomDefectPrioriteListCard(defectTitle: "Пошкоджений малюнок протектора", defectTitleCzech:  "český název"),
    //Container(color: Colors.red),
    //Container(color: Colors.red),
  ];*/
  List<int> priorityDefectIndexes = getActiveDefectPriorityIndexes();

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      padding: EdgeInsets.all(20),
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      itemBuilder: (context, index) {
        return CustomDefectPriorityListCard(
          defect: ActiveDefects[priorityDefectIndexes[index]],
        );
      },
      itemCount: priorityDefectIndexes.length,
    );

    /* GridView.builder(
      shrinkWrap: true,
      //primary: true,
      padding: EdgeInsets.all(20),
      //physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        // width / height: fixed for *all* items
      ),
      itemBuilder: (context, i) => CustomDefectPriorityListCard(
        defect: ActiveDefects[priorityDefectIndexes[i]],
      ),
      itemCount: priorityDefectIndexes.length,
    ); */
  }

  /*return CustomCardPrioriteDefect(
      defectTitle: "Пошкоджений малюнок протектора",
      defectTitleCzech: "protlačené vyhazovače",
    );*/

  /*return Center(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return CustomCardPrioriteDefect(defectTitle: "Titul defektu");
        }),
      ),
    );*/
}

class CustomDefectPriorityListCard extends StatefulWidget {
  const CustomDefectPriorityListCard({super.key, required this.defect});

  final Defect defect;

  @override
  State<CustomDefectPriorityListCard> createState() =>
      _CustomDefectPriorityListCardState();
}

class _CustomDefectPriorityListCardState
    extends State<CustomDefectPriorityListCard> {
  final Color _backgroundColor = baseColor2;

  //final String defectTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),

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
              SizedBox(width: 15),
              Text(
                "${widget.defect.count}x",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: 425,
                      child: Text(
                        widget.defect.name[myLanguageCode]!,
                        style: TextStyle(
                          fontSize: (widget.defect.name[myLanguageCode]!.length < 20 ? 30 : 25),
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      (widget.defect.name[primaryLanguageCode] == null ? "" : widget.defect.name[primaryLanguageCode]!),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButtonForPriorityList(
                btnOnTap: () {
                  widget.defect.logDefect();
                  setState(() {});
                },
                btnColor: Colors.green,
                btnIcon: Icons.add,
              ),
              CustomButtonForPriorityList(
                btnOnTap: () {
                  widget.defect.unLogDefect();
                  setState(() {});
                },
                btnColor: Colors.red,
                btnIcon: Icons.remove,
              ),
            ],
          )
        ],
      ),
    );

    /* Wrap(
      children: [
        Container(
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
                  SizedBox(width: 15),
                  Text(
                    "${widget.defect.count}x",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      SizedBox(
                        width: 380,
                        child: Text(
                          widget.defect.title,
                          style: TextStyle(
                            fontSize:
                                (widget.defect.title.length < 20 ? 30 : 25),
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text((widget.defect.titleCzech == null
                          ? ""
                          : widget.defect.titleCzech!)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 0),
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
                    btnOnTap: () {
                      widget.defect.updateCountByOneUp();
                      setState(() {});
                    },
                    btnColor: Colors.green,
                    btnIcon: Icons.add,
                  ),
                  Spacer(),
                  CustomButtonForPriorityList(
                    btnOnTap: () {
                      widget.defect.updateCountByOneDown();
                      setState(() {});
                    },
                    btnColor: Colors.red,
                    btnIcon: Icons.remove,
                  ),
                  Spacer(),
                ],
              ),
              Spacer(),
            ],
          ),
        )
      ],
    ); */
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
