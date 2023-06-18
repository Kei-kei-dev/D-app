import 'package:d_app/screens/onboarding/widgets/custom_button.dart';
import 'package:d_app/screens/onboarding/widgets/custom_image_container.dart';
import 'package:d_app/screens/onboarding/widgets/custom_text_header.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Pictures extends StatelessWidget {
  final TabController tabController;

  const Pictures({super.key, required this.tabController});

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
                CustomTextHeader(
                    tabController: tabController,
                    text: 'Add 2 or More Pictures'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomImageContainer(tabController: tabController),
                    CustomImageContainer(tabController: tabController),
                    CustomImageContainer(tabController: tabController),
                  ],
                ),
                Row(
                  children: [
                    CustomImageContainer(tabController: tabController),
                    CustomImageContainer(tabController: tabController),
                    CustomImageContainer(tabController: tabController),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                StepProgressIndicator(
                  totalSteps: 6,
                  currentStep: 4,
                  selectedColor: Colors.black54,
                  unselectedColor: Colors.black12,
                ),
                SizedBox(height: 10),
                CustomButton(tabController: tabController, text: 'Next STEP'),
              ],
            ),
          ],
        ));
  }
}
