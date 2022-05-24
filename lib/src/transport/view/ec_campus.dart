import 'package:flutter/material.dart';
import 'package:pesu/src/transport/view/routes_campus.dart';

class ECCampus extends StatefulWidget {
  const ECCampus({Key? key}) : super(key: key);

  @override
  State<ECCampus> createState() => _ECCampusState();
}

class _ECCampusState extends State<ECCampus> {
  @override
  Widget build(BuildContext context) {
    return Container(
  child:    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoutesCampus(),
        ],
      ),
    );
  }
}
