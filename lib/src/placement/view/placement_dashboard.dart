import 'package:flutter/material.dart';
import 'package:pesu/utils/view/widget.dart';

class PlacementDashboard extends StatefulWidget {
  const PlacementDashboard({Key? key}) : super(key: key);

  @override
  State<PlacementDashboard> createState() => _PlacementDashboardState();
}

class _PlacementDashboardState extends State<PlacementDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: sideNavAppBar("Placements"),
      body: Container(
        child: Center(
          child: Text("Placement details not available",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 16
          ),
          ),
        ),
      ),
    );
  }
}
