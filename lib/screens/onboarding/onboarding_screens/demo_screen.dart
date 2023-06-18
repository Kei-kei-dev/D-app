import 'package:d_app/screens/onboarding/widgets/custom_button.dart';
import 'package:d_app/screens/onboarding/widgets/custom_text_field.dart';
import 'package:d_app/screens/onboarding/widgets/custom_text_header.dart';
import 'package:d_app/screens/onboarding/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Demo extends StatelessWidget {
  final TabController tabController;

  const Demo({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHeader(tabController: tabController, text: 'あなたの性別は？'),
              SizedBox(height: 10),
              CustomCheckbox(tabController: tabController, text: '男性'),
              CustomCheckbox(tabController: tabController, text: '女性'),
              SizedBox(height: 100),
              CustomTextHeader(tabController: tabController, text: 'あなたの年齢は？'),
              CustomTextField(
                  tabController: tabController, text: 'ENTER YOUR AGE')
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 3,
                selectedColor: Colors.black54,
                unselectedColor: Colors.black12,
              ),
              SizedBox(height: 10),
              CustomButton(tabController: tabController, text: 'Next STEP'),
            ],
          ),
        ],
      ),
    );
  }
}
