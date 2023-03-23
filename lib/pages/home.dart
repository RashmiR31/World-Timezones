import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    // set background
    Color bgColor = data['isDayTime'] ? Colors.pink.shade300 : Colors.blue.shade100;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0,120.0,0.0,0.0),
          child: Column(
            children: [
              ElevatedButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context,'/location');
                    setState(() {
                      data = {
                        'time':result['time'],
                        'location': result['location'],
                        'isDayTime':result['isDayTime'],
                        'flag':result['flag']
                      };
                    });
                  },
                icon: const Icon(Icons.edit_location),
                label: const Text("Edit Location"),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 2.0,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0,),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
