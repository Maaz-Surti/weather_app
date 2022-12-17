import 'package:flutter/material.dart';
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

    print(instance.time);
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading"),
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text(time),
      ),
    );
  }
}
