import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../constants/routes.dart';
import '../services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "loading";

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      location: 'Berlin',
      flag: 'berlin.jpg',
      url: 'Europe/Berlin',
    );

    await instance.getTime();

    if (!mounted) return;

    Navigator.pushReplacementNamed(context, home, arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitPouringHourGlass(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
