import 'package:d_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => ProfileScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final User user = User.users[0];
    return Scaffold(
        appBar: CustomAppBar(title: 'Profile'),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(3, 3),
                            blurRadius: 3,
                            spreadRadius: 3)
                      ],
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(user.imageUrls[0]))),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(0, 0, 0, 0),
                          Color.fromARGB(200, 0, 0, 0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Text(
                        user.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 30),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWithIcon(title: 'Biography', icon: Icons.edit),
                  Text(
                    user.bio,
                    style: TextStyle(color: Colors.black54),
                  ),
                  TitleWithIcon(title: 'Pictures', icon: Icons.edit),
                  SizedBox(
                    height: 125,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Container(
                              height: 125,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(color: Colors.grey),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(user.imageUrls[index]),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  TitleWithIcon(title: 'Location', icon: Icons.edit),
                  Text(
                    '京都府, 京田辺市',
                    style: TextStyle(color: Colors.black54),
                  ),
                  TitleWithIcon(title: 'Interest', icon: Icons.edit),
                ],
              ),
            )
          ],
        ));
  }
}

class TitleWithIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  const TitleWithIcon({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        IconButton(onPressed: () {}, icon: Icon(icon))
      ],
    );
  }
}
