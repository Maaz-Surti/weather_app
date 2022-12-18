import 'package:flutter/material.dart';
import 'package:weather_app/views/choose_location.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    String bgImage = data['isDay'] ? 'day.png' : 'night.png';
    Color bgColor =
        data['isDay'] ? Colors.blue : Colors.indigo[700] ?? Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: SafeArea(
              child: Column(
            children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChooseLocation()));
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDay': result['isDay'],
                      'flag': result['flag'],
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[300],
                ),
                label: Text(
                  "Edit Location",
                  style: TextStyle(color: Colors.grey[300]),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                data['time'],
                style: const TextStyle(
                  fontSize: 66,
                  color: Colors.white,
                  letterSpacing: -2,
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
