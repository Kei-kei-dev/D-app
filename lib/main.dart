import 'package:flutter/material.dart';

import 'package:d_app/config/app_router.dart';
import 'package:d_app/screens/screens.dart';
import 'package:d_app/blocs/swipe/swipe_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SwipeBloc()..add(LoadUserEvent(users: User.users)),
        )
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
