import 'package:flutter/material.dart';
import 'package:flutter_stopwatch/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Stopwatch",
      //     textAlign: TextAlign.center,
      //   ),
      //   centerTitle: true,
      // ),
      backgroundColor: Color(0xff1c2757),
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
