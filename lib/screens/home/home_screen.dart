import 'package:d_app/blocs/swipe/swipe_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: CustomAppBar(title: 'match'),
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if (state is SwipeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SwipeLoaded) {
            return Column(
              children: [
                InkWell(
                  onDoubleTap: () {
                    Navigator.pushNamed(context, '/users',
                        arguments: state.users[0]);
                  },
                  child: Draggable(
                    child: UserCard(user: state.users[0]),
                    feedback: UserCard(user: state.users[0]),
                    childWhenDragging: UserCard(user: state.users[1]),
                    onDragEnd: (drag) {
                      if (drag.velocity.pixelsPerSecond.dx < 0) {
                        context.read<SwipeBloc>()
                          ..add(SwipeLeftEvent(user: state.users[0]));
                        print('左にスワイプしました。');
                      } else {
                        context.read<SwipeBloc>()
                          ..add(SwipeRightEvent(user: state.users[0]));
                        print('右にスワイプしました。');
                      }
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<SwipeBloc>()
                            ..add(SwipeLeftEvent(user: state.users[0]));
                          print('左にスワイプしました。');
                        },
                        child: ChoiceButton(
                            width: 60,
                            height: 60,
                            size: 25,
                            color: Color.fromARGB(115, 163, 31, 31),
                            icon: Icons.clear_rounded),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<SwipeBloc>()
                            ..add(SwipeRightEvent(user: state.users[0]));
                          print('右にスワイプしました。');
                        },
                        child: ChoiceButton(
                            width: 80,
                            height: 80,
                            size: 30,
                            color: Color.fromARGB(115, 163, 31, 31),
                            icon: Icons.favorite),
                      ),
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
            );
          } else {
            return Text('何かがおかしいです');
          }
        },
      ),
    );
  }
}
