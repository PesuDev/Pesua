import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pesu/utils/view/widget.dart';

class TransportDashboard extends StatefulWidget {
  const TransportDashboard({Key? key}) : super(key: key);

  @override
  _TransportDashboardState createState() => _TransportDashboardState();
}

class _TransportDashboardState extends State<TransportDashboard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      child: Scaffold(

appBar: sideNavAppBar("Transport"),
        drawer: Container(),
        body: Container(
          child: TabBarView(

            children: [
              Text("j"),
              Text("jh"),
            ],

          ),
        ),
      ),
    );
  }
}
