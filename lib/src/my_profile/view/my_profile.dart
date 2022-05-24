import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pesu/utils/view/widget.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sideNavAppBar("My Profile"),
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 15, top: 20, right: 35, bottom: 20),
                    child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Icon(
                            Icons.perm_identity_rounded,
                            size: 100,
                          ),
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Student401",
                        style: TextStyle(color: Colors.white60),
                      ),
                      Text(
                        "PESU ID:S401",
                        style: TextStyle(color: Colors.white60),
                      ),
                      Text(
                        "SRN: S401",
                        style: TextStyle(color: Colors.white60),
                      ),
                      Text(
                        "B.TECH. | BRANCH:CSE",
                        style: TextStyle(color: Colors.white60),
                      ),
                      Text(
                        "SEM-4, SECTION A",
                        style: TextStyle(color: Colors.white60),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
