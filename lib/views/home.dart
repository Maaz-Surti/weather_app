import 'package:flutter/material.dart';
import 'package:weather_app/views/choose_location.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChooseLocation()));
            },
            icon: Icon(Icons.edit_location),
            label: Text("Edit Location"),
          )
        ],
      )),
    );
  }
}
