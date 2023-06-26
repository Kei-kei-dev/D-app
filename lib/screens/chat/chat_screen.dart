import 'package:d_app/models/models.dart';
import 'package:d_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = '/chat';

  static Route route({required UserMatch userMatch}) {
    return MaterialPageRoute(
      builder: (_) => ChatScreen(userMatch: userMatch),
      settings: RouteSettings(name: routeName),
    );
  }

  final UserMatch userMatch;

  const ChatScreen({required this.userMatch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Column(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(userMatch.matchedUser.imageUrls[0]),
            ),
            Text(
              userMatch.matchedUser.name,
              style: TextStyle(color: Colors.black, fontSize: 15),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: userMatch.chat != null
                  ? Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: userMatch.chat![0].messages.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: userMatch.chat![0].messages[index]
                                            .senderId ==
                                        1
                                    ? Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                              color: Colors.blueGrey),
                                          child: Text(userMatch.chat![0]
                                              .messages[index].message),
                                        ))
                                    : Align(
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 15,
                                              backgroundImage: NetworkImage(
                                                  userMatch.matchedUser
                                                      .imageUrls[0]),
                                            ),
                                            SizedBox(width: 10),
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8.0)),
                                                  color: Colors.amber),
                                              child: Text(userMatch.chat![0]
                                                  .messages[index].message),
                                            ),
                                          ],
                                        )));
                          }),
                    )
                  : SizedBox(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send_outlined),
                      color: Colors.white,
                    )),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '何か入力して',
                      contentPadding:
                          const EdgeInsets.only(left: 20, bottom: 5, top: 5),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
