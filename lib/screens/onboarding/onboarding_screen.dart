import 'package:d_app/screens/onboarding/onboarding_screens/bio_screen.dart';
import 'package:d_app/screens/onboarding/onboarding_screens/demo_screen.dart';
import 'package:d_app/screens/onboarding/onboarding_screens/email_verification_screen.dart';
import 'package:d_app/screens/onboarding/onboarding_screens/pictures_screen.dart';
import 'package:d_app/screens/onboarding/onboarding_screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:d_app/widgets/widgets.dart';

import 'onboarding_screens/email_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => OnboardingScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  static const List<Tab> tabs = <Tab>[
    Tab(text: 'start'),
    Tab(text: 'Email'),
    Tab(text: 'Email Verification'),
    Tab(text: 'Demo'),
    Tab(text: 'Pictures'),
    Tab(text: 'Biography'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {}
        });

        return Scaffold(
          appBar: CustomAppBar(
            title: 'ARROW',
            hasActions: false,
          ),
          body: TabBarView(children: [
            Start(tabController: tabController),
            Email(tabController: tabController),
            EmailVerification(tabController: tabController),
            Demo(tabController: tabController),
            Pictures(tabController: tabController),
            Biography(tabController: tabController),
          ]),
        );
      }),
    );
  }
}
