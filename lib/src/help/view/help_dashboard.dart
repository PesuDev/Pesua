import 'package:flutter/material.dart';
import 'package:pesu/utils/view/widget.dart';

class HelpDashboard extends StatefulWidget {
  const HelpDashboard({Key? key}) : super(key: key);

  @override
  State<HelpDashboard> createState() => _HelpDashboardState();
}

class _HelpDashboardState extends State<HelpDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sideNavAppBar("Help"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15.0,top: 10,bottom: 10),
              child: Text("FAQs",style: TextStyle(
fontSize: 20,
                color: Color(0xffED4700)
              ),),
            ),
            Container(
              margin: const EdgeInsets.only(left:15.0,right: 10,bottom: 20),
                child: Divider(
                  height: 2,
                )),
            ListTileTheme.merge(
              dense: true,
              child: ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) { return ExpansionTile(title: Text("I am not able to login to the app "),
              childrenPadding: EdgeInsets.only(left: 15,right: 15,bottom: 15,top: 15),
              children: [
                Text("Check if you have entered your login credentials correctly.If you still face any issues, reset your password using forgot password, password will be sent to your registered email id.")
              ],
              );

                },

              ),
            )
          ],
        ),
      ),

    );
  }
}
