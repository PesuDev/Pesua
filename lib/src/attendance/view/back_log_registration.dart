import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pesu/utils/view/widget.dart';

class BackLogRegistration extends StatefulWidget {
  const BackLogRegistration({Key? key}) : super(key: key);

  @override
  State<BackLogRegistration> createState() => _BackLogRegistrationState();
}

class _BackLogRegistrationState extends State<BackLogRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: sideNavAppBar("Backlog Registration"),
      drawer: Container(),
body: Container(
  margin: EdgeInsets.symmetric(vertical: 20,horizontal: 25),
  child: Center(
    child: Text("Backlog/Improvement Registration option available only on student web portal, please visit pesuacademy.com for registration",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14
    ),
    ),
  ),
),
    );
  }
}
