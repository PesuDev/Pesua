import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
titleSpacing: 0,
  title: Row(
    children: [
      Container(
        child: IconButton(icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: (){

          },

        ),
      ),
      Text("Setting"),
    ],
  ),

),

      drawer: Container(),
      backgroundColor:        Colors.white.withOpacity(0.9),
      body: Container(
        color: Colors.white,
              padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.white.withOpacity(0.8),

                child: Container(

                  margin: EdgeInsets.only(top: 15,bottom: 15,right: 15,left: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subscribe for notifications"),
Container(
    height: 30,
    child: FlutterSwitch(value: true, onToggle: (onToggle){}))
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Synchronize Data"),
                          Icon(Icons.sync,color: Colors.blueAccent,)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text("  App Version:",
                  style: TextStyle(
                    color: Colors.orangeAccent
                  ),),
                  Text(" 98.44"),
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
