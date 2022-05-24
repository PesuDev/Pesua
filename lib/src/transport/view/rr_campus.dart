import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/src/transport/view/routes_campus.dart';

class RRCampus extends StatefulWidget {
  const RRCampus({Key? key}) : super(key: key);

  @override
  _RRCampusState createState() => _RRCampusState();
}

class _RRCampusState extends State<RRCampus> {
  @override
  Widget build(BuildContext context) {
    return Container(
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    RoutesCampus(),
  ],
),
    );
  }
}
