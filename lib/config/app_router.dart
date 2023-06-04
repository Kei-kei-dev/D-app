import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/chat/chat_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/matches/matches_screen.dart';
import '../screens/users/users_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case MatchesScreen.routeName:
        return MatchesScreen.route();
      case UserScreen.routeName:
        return UserScreen.route(user: settings.arguments as User);
      case ChatScreen.routeName:
        return ChatScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: Text('error'))),
      settings: RouteSettings(name: '/error'),
    );
  }
}
