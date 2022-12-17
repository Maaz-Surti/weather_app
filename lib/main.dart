import 'package:flutter/material.dart';
import 'package:weather_app/constants/routes.dart';
import 'package:weather_app/views/choose_location.dart';
import 'package:weather_app/views/home.dart';
import 'package:weather_app/views/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: loading,
    routes: {
      home: (context) => const HomeView(),
      chooseLocation: (context) => const ChooseLocation(),
      loading: (context) => const Loading(),
    },
  ));
}
