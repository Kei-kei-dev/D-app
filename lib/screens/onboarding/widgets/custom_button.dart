import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;

  const CustomButton(
      {super.key, required this.tabController, this.text = 'スタート'});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: LinearGradient(colors: [Colors.black12, Colors.white10])),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
            ),
            onPressed: () {
              tabController.animateTo(tabController.index + 1);
            },
            child: Container(
                width: double.infinity, child: Center(child: Text(text)))));
  }
}
