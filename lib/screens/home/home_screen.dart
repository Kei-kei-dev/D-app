import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          UserCard(user: User.users[0]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChoiceButton(
                    width: 60,
                    height: 60,
                    size: 25,
                    color: Color.fromARGB(115, 163, 31, 31),
                    icon: Icons.clear_rounded),
                ChoiceButton(
                    width: 80,
                    height: 80,
                    size: 30,
                    color: Color.fromARGB(115, 163, 31, 31),
                    icon: Icons.favorite),
                ChoiceButton(
                    width: 60,
                    height: 60,
                    size: 25,
                    color: Color.fromARGB(115, 163, 31, 31),
                    icon: Icons.watch_later),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final Color color;
  final IconData icon;
  // グラデーションをつけるプロパティはなし

  const ChoiceButton(
      {super.key,
      required this.width,
      required this.height,
      required this.size,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withAlpha(50),
                spreadRadius: 4,
                blurRadius: 4,
                offset: Offset(3, 3))
          ]),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}
