import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/utils/view/widget.dart';

class IsaResultGraph extends StatefulWidget {
  const IsaResultGraph({Key? key}) : super(key: key);

  @override
  State<IsaResultGraph> createState() => _IsaResultGraphState();
}

class _IsaResultGraphState extends State<IsaResultGraph> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sideNavAppBar("ISA Results graph"),
      body: Container(
        padding: EdgeInsets.all(12.0),
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text("UE20CS251 - Design and Analysis of Algorithms"),
            ),
            //https://www.digitalocean.com/community/tutorials/flutter-bar-charts GO TO THIS LINK
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Summary"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [Text("Your Score"), Text("-1")],
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  children: [Text("Average"), Text("24")],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
