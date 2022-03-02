import 'package:flutter/material.dart';
import 'package:flutter_stopwatch/screens/home/home_screen.dart';
import 'package:flutter_stopwatch/screens/splash_screen/components/background.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double _width = 80;
  double _height = 80;

  void gotoHome() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  void _updateState() async {
    await Future.delayed(Duration(milliseconds: 100), () {});
    setState(() {
      _width = 300;
      _height = 300;
      gotoHome();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _updateState();
    gotoHome();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        width: double.infinity,
        child: Image.asset('assets/gif/stopwatch.gif'),
      ),
      // child: AnimatedContainer(
      //   duration: Duration(milliseconds: (1500)),
      //   width: _width,
      //   height: _height,
      //   child: Center(
      //     child: Image.asset('assets/images/splash_dark.png'),
      //   ),
      // ),
    );
  }
}
