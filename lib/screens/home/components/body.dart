import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_stopwatch/screens/test_screen/components/background.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int milliseconds = 0, seconds = 0, minutes = 0, hours = 0;
  String digitMilliseconds = "000", digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  //starting timer function
  // void start() {
  //   print(started);
  //   setState(() {
  //     started = true;
  //   });
  //   print(started);
  //   timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
  //     int localMilliseconds = milliseconds + 1;
  //     int localSeconds = seconds;
  //     int localMinutes = minutes;
  //     int localHours = hours;
  //
  //     // perfectly works in release version
  //     // but don't know why not working perfectly in build version and other version
  //
  //     if (localMilliseconds > 1000) {
  //       if (localSeconds > 59) {
  //         if (localMinutes > 59) {
  //           localHours++;
  //           localMinutes = 0;
  //         } else {
  //           localMinutes++;
  //           localSeconds = 0;
  //         }
  //       } else {
  //         localSeconds++;
  //         localMilliseconds = 0;
  //       }
  //     }
  //     // print("$localHours:$localMinutes:$localSeconds:$localMicroseconds");
  //     setState(() {
  //       milliseconds = localMilliseconds.toInt();
  //       seconds = localSeconds;
  //       minutes = localMinutes;
  //       hours = localHours;
  //
  //       digitMilliseconds = (milliseconds == 1000)
  //           ? milliseconds.toString().substring(0,3)
  //           : (milliseconds >= 100)
  //               ? "$milliseconds"
  //               : (milliseconds >= 10)
  //                   ? "0$milliseconds"
  //                   : "00$milliseconds";
  //       // digitMicroseconds = digitMicroseconds.length > 3 ? (microseconds~/10).toString() : digitMicroseconds;
  //       digitMilliseconds = digitMilliseconds;
  //       digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
  //       digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
  //       digitHours = (hours >= 10) ? "$hours" : "0$hours";
  //
  //       print("$digitHours:$digitMinutes:$digitSeconds:$digitMilliseconds");
  //     });
  //   });
  // }

  void start() {
    print(started);
    setState(() {
      started = true;
    });
    print(started);
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      // perfectly works in release version
      // but don't know why not working perfectly in build version and other version

        if (localSeconds > 59) {
          if (localMinutes > 59) {
            localHours++;
            localMinutes = 0;
          } else {
            localMinutes++;
            localSeconds = 0;
          }
        }
      // print("$localHours:$localMinutes:$localSeconds:$localMicroseconds");
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;

        digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
        digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
        digitHours = (hours >= 10) ? "$hours" : "0$hours";

        print("$digitHours:$digitMinutes:$digitSeconds");
        // print("$digitHours:$digitMinutes:$digitSeconds:$digitMilliseconds");
      });
    });
  }

  //stop function
  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  //reset function
  void reset() {
    print("Reset pressed");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Color(0x00ffffff),
        content: Text(
          "long press 'reset' to clear lap list", style: TextStyle(color: Color(0xffffffff)),
        ),
      ),
    );

    timer!.cancel();
    setState(() {
      milliseconds = 0;
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitMilliseconds = "000";
      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";

      started = false;
    });
  }

  //add laps
  void addLaps() {
    print("Lap pressed");
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
    // String lap = "$digitHours:$digitMinutes:$digitSeconds:$digitMilliseconds";
    setState(() {
      laps.insert(0, lap);
    });
  }

  //clear laps
  void clearLaps(BuildContext context) {
    print("Reset Long pressed");
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        print("Laps List cleared");
        setState(() {
          laps.clear();
          Navigator.of(context).pop(); // dismiss dialog
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color(0xff323f68),
      title: Text("Clear Laps", style: TextStyle(color: Colors.blue),),
      content: Text("Would you like to continue clearing laps list?", style: TextStyle(color: Colors.white),),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "StopWatch",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  "$digitHours:$digitMinutes:$digitSeconds",
                  // "$digitHours:$digitMinutes:$digitSeconds:$digitMilliseconds",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 400.0,
                decoration: BoxDecoration(
                  color: Color(0xff323f68),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListView.builder(
                  itemCount: laps.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lap no -> ${laps.length - (index)}",
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          Text(
                            "${laps[index]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {
                        print("Start/pause pressed");
                        started ? stop() : start();
                      },
                      shape: const StadiumBorder(
                        side: BorderSide(color: Colors.blue),
                      ),
                      child: Text(
                        started ? "Pause" : "Start",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  IconButton(
                    color: Colors.white,
                    onPressed: () {
                      addLaps();
                    },
                    icon: Icon(Icons.flag),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {
                        reset();
                      },
                      onLongPress: () {
                        if (laps.length > 0) {
                          clearLaps(context);
                        }
                      },
                      shape: const StadiumBorder(),
                      fillColor: Colors.blue,
                      child: Text(
                        "Reset",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
