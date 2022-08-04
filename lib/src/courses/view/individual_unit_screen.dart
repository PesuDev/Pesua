import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/utils/view/widget.dart';

class IndividualUnitScreen extends StatefulWidget {
  String? title;

  IndividualUnitScreen({@required this.title});

  @override
  State<IndividualUnitScreen> createState() => _IndividualUnitScreenState();
}

class _IndividualUnitScreenState extends State<IndividualUnitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sideNavAppBar(widget.title ?? ''),
      body: Container(
        padding: EdgeInsets.only(top: 150, left: 20, right: 20, bottom: 8),
        child: Text(
            "ccccccc cccccccccccc cccccccccccc cccccccccccc ccccccccccccc ccccccccccc cccccccc"),
      ),
    );
  }
}
