import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final String text;

  const CustomButton(
      {super.key,
      required this.tabController,
      this.text = 'スタート',
      this.emailController,
      this.passwordController});

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
            onPressed: () async {
              if (emailController != null && passwordController != null) {
                await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                      email: emailController!.text,
                      password: passwordController!.text,
                    )
                    .then((value) => print("ユーザーが追加されました。"))
                    .catchError((error) => print("ユーザーを追加できませんでした。"));
              }
              tabController.animateTo(tabController.index + 1);
            },
            child: Container(
                width: double.infinity, child: Center(child: Text(text)))));
  }
}
