import 'package:d_app/screens/onboarding/widgets/custom_button.dart';
import 'package:d_app/screens/onboarding/widgets/custom_text_field.dart';
import 'package:d_app/screens/onboarding/widgets/custom_text_header.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Email extends StatelessWidget {
  final TabController tabController;

  const Email({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomTextHeader(
                  tabController: tabController, text: 'あなたのメールアドレスを教えて下さい'),
              CustomTextField(
                  tabController: tabController, text: 'ENTER YOUR EMAIL')
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 1,
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
