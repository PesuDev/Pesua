import 'dart:ffi';

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
  bool edit = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: sideNavAppBar("My Profile"),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
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
                        Container(
                          width: MediaQuery.of(context).size.width / 1.8,
                          padding: EdgeInsets.only(top: 8, right: 8, bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Student401 Student402 student403 student405 student406",
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
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                      top: 12,
                      right: 12,
                      left: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (edit == false) {
                                    edit = true;
                                  } else if (edit == true) {
                                    edit = false;
                                  }
                                  print('$edit');
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 5, bottom: 5, left: 12, right: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: (edit == false)
                                      ? Colors.blueGrey
                                      : Colors.orangeAccent,
                                  /*    boxShadow: [
                                    BoxShadow(
                                        color: Colors.blueGrey, spreadRadius: 3),
                                  ],*/
                                ),
                                child: Text(
                                  (edit == false) ? "Edit" : "Cancel",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "Email ID",
                              style: TextStyle(color: Colors.black45),
                            )),
                        (edit == false)
                            ? Text('priyahcbhdbc@gmail.com')
                            //ON CLICK OF EDIT
                            : Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 6,
                                        color: Colors.blue)
                                  ],
                                  border: Border.all(color: Colors.blueAccent),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                )),
                        Container(
                            padding: EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              "Contact No",
                              style: TextStyle(color: Colors.black45),
                            )),
                        (edit == false)
                            ? Text('9876543210')
                            //ON CLICK OF EDIT
                            : Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 6,
                                        color: Colors.blue)
                                  ],
                                  border: Border.all(color: Colors.blueAccent),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                )),
                        (edit == true)
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0, bottom: 15, top: 25),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.blue,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.blue, spreadRadius: 3),
                                    ],
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      _updateBottomSheet();
                                    },
                                    child: Text(
                                      "Update",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                height: 10,
                              ),
                        Container(
                          padding: EdgeInsets.only(left: 5, bottom: 20),
                          child: Column(
                            children: [
                              Divider(
                                color: Colors.grey[450],
                                thickness: 1,
                              ),
                              InkWell(
                                onTap: () {
                                  changePasswordPopUp();
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.vpn_key_outlined,
                                      size: 16,
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 8),
                                        child: Text("Change Password")),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.grey[450],
                                thickness: 1,
                              ),
                              InkWell(
                                onTap: () {
                                  _updateBottomSheet();
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      size: 16,
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 8),
                                        child: Text("Logout")),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                  padding:
                      EdgeInsets.only(top: 12, right: 12, left: 16, bottom: 10),
                  child: Text(
                    "Qualifying Examination",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  top: 12,
                  right: 12,
                  left: 16,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            int? itemCount = 3;
                            return Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  padding: EdgeInsets.only(left: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [Text("Exam"), Text("NA")],
                                  ),
                                ),
                                (index != itemCount - 1)
                                    ? VerticalDivider(
                                        color: Colors.grey,
                                      )
                                    : Container(),
                              ],
                            );
                          }),
                    ),
                    Text("Parent Details")
                  ],
                ),
              ),
              Container(
                  padding:
                      EdgeInsets.only(top: 12, right: 12, left: 16, bottom: 10),
                  child: Text(
                    "Parents Details",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              Container(
                color: Colors.white,
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  void changePasswordPopUp() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: Container(
                height: MediaQuery.of(context).size.height / 1.8,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(7.0),
                          topRight: const Radius.circular(7.0),
                        ),
                        color: Colors.blue,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.vpn_key_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                "Change Password",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Current Password"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  left: 8, top: 0, bottom: 0, right: 8),
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                /* boxShadow: [
                                  BoxShadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 6,
                                      color: Colors.grey)
                                ],*/
                                border: Border.all(color: Colors.grey),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Your Current Password",
                                    hintStyle: TextStyle(fontSize: 13)),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Current Password"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  left: 8, top: 0, bottom: 0, right: 8),
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                /* boxShadow: [
                                  BoxShadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 6,
                                      color: Colors.grey)
                                ],*/
                                border: Border.all(color: Colors.grey),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Your Current Password",
                                    hintStyle: TextStyle(fontSize: 13)),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Current Password"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  left: 8, top: 0, bottom: 0, right: 8),
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                /* boxShadow: [
                                  BoxShadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 6,
                                      color: Colors.grey)
                                ],*/
                                border: Border.all(color: Colors.grey),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Your Current Password",
                                    hintStyle: TextStyle(fontSize: 13)),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey[500],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 2, bottom: 2, left: 10, right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                            ),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 8),
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 2, bottom: 2, left: 10, right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.blue),
                              color: Colors.blue,
                            ),
                            child: Text(
                              "Save Changes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        });
  }

  void _updateBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: MediaQuery.of(context).size.height * 0.20,
            color: Color(0xFF737373),
            //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                padding: EdgeInsets.only(
                  top: 15,
                ),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0))),
                child: Column(
                  children: [
                    new Text(
                      "Update Details",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new Text(
                      "Are you sure you want update details?",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(
                                top: 8.0, bottom: 8.0, left: 18, right: 18),
                            child: Text(
                              "No",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.grey[500],
                          thickness: 2,
                          width: 2,
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 18, right: 18),
                          child: Text(
                            "yes",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          );
        });
  }
}
