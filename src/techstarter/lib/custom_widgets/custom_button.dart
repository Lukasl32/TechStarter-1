import 'package:flutter/material.dart';

class CustomButtonForList extends StatelessWidget {
  final GestureTapCallback btnOnTap;
  final IconData btnIcon;
  final Color btnColor;

  final double _btnWidth = 80;
  final double _btnIconSize = 40;
  final double _btnBorderRadius = 20;

  const CustomButtonForList({super.key, required this.btnOnTap, required this.btnIcon, required this.btnColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: btnColor,
      borderRadius: BorderRadius.circular(_btnBorderRadius),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_btnBorderRadius),
        ),
        onTap: btnOnTap,
        child: Align(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(width: _btnWidth),
                Icon(btnIcon, size: _btnIconSize),
                SizedBox(width: _btnWidth),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonForPriorityList extends StatelessWidget {
  final GestureTapCallback btnOnTap;
  final IconData btnIcon;
  final Color btnColor;

  final double _btnHeight = 80;
  final double _btnWidth = 180;
  final double _btnIconSize = 40;
  final double _btnBorderRadius = 20;

  const CustomButtonForPriorityList({super.key, required this.btnOnTap, required this.btnIcon, required this.btnColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: btnColor,
      borderRadius: BorderRadius.circular(_btnBorderRadius),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_btnBorderRadius),
        ),
        onTap: btnOnTap,
        child: Align(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                SizedBox(height: _btnHeight),
                Column(
                  children: [
                    SizedBox(width: _btnWidth),
                    Icon(btnIcon, size: _btnIconSize),
                    SizedBox(width: _btnWidth),
                  ],
                ),
                SizedBox(height: _btnHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
