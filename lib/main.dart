import 'dart:async';
import 'package:alarm_clock/components/clock_view.dart';
import 'package:alarm_clock/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? _everySec;

  @override
  void initState() {
    super.initState();

    _everySec = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        // You can perform some actions here every second if needed.
      });
    });
  }

  @override
  void dispose() {
    _everySec?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfafafa),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TimerBuilder.periodic(
                Duration(seconds: 1),
                builder: (context) {
                  String minute = DateTime.now().minute < 10
                      ? "0${DateTime.now().minute}"
                      : DateTime.now().minute.toString();
                  String hour = DateTime.now().hour < 10
                      ? "0${DateTime.now().hour}"
                      : DateTime.now().hour.toString();
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today",
                            style: AppStyle.mainTextThin,
                          ),
                          Text(
                            "${hour}:${minute}",
                            style: AppStyle.maintext,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      ClockView(DateTime(DateTime.now().hour,
                          DateTime.now().minute, DateTime.now().second)),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
