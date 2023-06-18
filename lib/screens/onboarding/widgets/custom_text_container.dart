import 'package:flutter/material.dart';

class CustomTextContainer extends StatelessWidget {
  final TabController tabController;
  final String text;

  const CustomTextContainer(
      {super.key, required this.tabController, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 5),
      child: Container(
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient:
                LinearGradient(colors: [Colors.greenAccent, Colors.lightBlue])),
        child: Center(
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
