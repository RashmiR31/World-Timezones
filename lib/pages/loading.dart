import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupWorldTime() async{
    WorldTime wt = WorldTime(location: "Kolkata", flag: "india.png",url: "Asia/Kolkata");
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wt.location,
      'flag':wt.flag,
      'time':wt.time,
      'isDayTime': wt.isDayTime,
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
      backgroundColor: Colors.blue.shade700,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}

