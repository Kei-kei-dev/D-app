import 'package:d_app/screens/onboarding/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  final TabController tabController;

  const Start({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/logo.jpg')),
              SizedBox(height: 50),
              Text('ようこそ'),
              Text('ここにアプリに関する様々な情報が入ります。'),
            ],
          ),
          CustomButton(tabController: tabController),
        ],
      ),
    );
  }
}
