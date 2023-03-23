import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: "Kolkata", flag: "india.png",url: "Asia/Kolkata"),
    WorldTime(location: "London", flag: "uk.png",url: "Europe/London"),
    WorldTime(location: "Chicago", flag: "usa.png",url: "America/Chicago"),
    WorldTime(location: "Jakarta", flag: "south_korea.png",url: "Asia/Jakarta"),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context,{
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    print("build function ran");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical:1.0,horizontal: 4.0 ),              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}') ,
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}
