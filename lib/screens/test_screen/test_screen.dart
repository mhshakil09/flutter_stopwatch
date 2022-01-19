import 'package:flutter/material.dart';
import 'package:flutter_stopwatch/screens/test_screen/components/body.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
