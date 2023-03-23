import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location=''; //location name for the UI
  String time=''; // time in that location
  String flag=''; // url to asset flag icon
  String url = ''; //location for api endpoint
  bool isDayTime=true;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(
          Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // print(datetime);
      // print(offset);
      // create a datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set time property
      time = DateFormat.jm().format(now);

      // set isDayTime?
      isDayTime = now.hour>6 && now.hour < 18 ? true : false;

    }
    catch (e){
      print("Error caught: $e");
      time = "Could not get time data";
    }
  }

}



