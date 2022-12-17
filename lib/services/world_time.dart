// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  WorldTime({
    required this.location,
    this.time = "",
    required this.flag,
    required this.url,
  });

  Future<void> getTime() async {
    var response =
        await http.get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map data = jsonDecode(response.body);
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    //print(offset);

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    time = now.toString();
  }
}
