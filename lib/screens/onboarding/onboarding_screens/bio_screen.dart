import 'package:d_app/screens/onboarding/widgets/custom_button.dart';
import 'package:d_app/widgets/custom_text_container.dart';
import 'package:d_app/screens/onboarding/widgets/custom_text_field.dart';
import 'package:d_app/screens/onboarding/widgets/custom_text_header.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Biography extends StatelessWidget {
  final TabController tabController;

  const Biography({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHeader(text: '自己紹介をして下さい'),
              CustomTextField(
                hint: 'ENTER YOUR bio',
                controller: controller,
              ),
              SizedBox(height: 100),
              CustomTextHeader(text: 'あなたの趣味は？'),
              Row(
                children: [
                  CustomTextContainer(tabController: tabController, text: '音楽'),
                  CustomTextContainer(tabController: tabController, text: '経済'),
                  CustomTextContainer(tabController: tabController, text: '芸術'),
                  CustomTextContainer(tabController: tabController, text: '政治'),
                ],
              ),
              Row(
                children: [
                  CustomTextContainer(
                      tabController: tabController, text: 'サッカー'),
                  CustomTextContainer(tabController: tabController, text: '野球'),
                  CustomTextContainer(
                      tabController: tabController, text: 'バスケ'),
                  CustomTextContainer(
                      tabController: tabController, text: 'テニス'),
                ],
              ),
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 5,
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
