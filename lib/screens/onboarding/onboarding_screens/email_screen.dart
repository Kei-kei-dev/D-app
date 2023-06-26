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
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHeader(text: 'あなたのメールアドレスを教えて下さい'),
              CustomTextField(
                  hint: 'ENTER YOUR EMAIL', controller: emailController),
              SizedBox(height: 100),
              CustomTextHeader(text: 'パスワードを選んでください'),
              CustomTextField(
                  hint: 'ENTER YOUR PASSWORD', controller: passwordController),
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
              CustomButton(
                  tabController: tabController,
                  text: 'Next STEP',
                  emailController: emailController,
                  passwordController: passwordController),
            ],
          ),
        ],
      ),
    );
  }
}
