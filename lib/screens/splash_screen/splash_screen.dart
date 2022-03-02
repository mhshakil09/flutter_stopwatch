import 'package:flutter/material.dart';
import 'package:flutter_stopwatch/screens/splash_screen/components/body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f9),
      body: Body(),
    );
  }
}
