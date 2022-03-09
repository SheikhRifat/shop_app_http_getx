import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:shop_app/src/pages/login_page.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        finishCallback: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
      ),
    );
  }

  final pages = [
    PageModel(
        color: Colors.black,
        imageAssetPath: 'assets/onboarding/1.png',
        title: 'Screen 1',
        body: 'Share your ideas with the team',
        doAnimateImage: true),
    PageModel(
      color: Colors.blue,
      imageAssetPath: 'assets/onboarding/2.png',
      title: 'Screen 2',
      body: 'See the increase in productivity & output',
      doAnimateImage: true,
    ),
    PageModel(
      color: Colors.green,
      imageAssetPath: 'assets/onboarding/3.png',
      title: 'Screen 3',
      body: 'Connect with the people from different places',
      doAnimateImage: true,
    ),
  ];
}
