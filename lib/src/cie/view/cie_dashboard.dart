import 'package:flutter/material.dart';
import 'package:pesu/utils/view/widget.dart';

class CieDashboard extends StatefulWidget {
  const CieDashboard({Key? key}) : super(key: key);

  @override
  State<CieDashboard> createState() => _CieDashboardState();
}

class _CieDashboardState extends State<CieDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white.withOpacity(0.9),
      appBar: sideNavAppBar("CIE"),
      body: Container(
        color: Colors.white.withOpacity(0.6),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height:MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage("https://images.hindustantimes.com/rf/image_size_640x362/HT/p2/2015/12/01/Pictures/_c34102da-9849-11e5-b4f4-1b7a09ed2cea.jpg")
                    
                  )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 10, right: 5, bottom: 10, top: 10),
                child: Text(
                  "Level 1",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                decoration: BoxDecoration(color: Color(0xff0091CD)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "The CIE Level 1 'Introduction to Entrepreneurship' course aims to provide students with an understanding of the nature of enterprise and entrepreneurship and introduces the role of the entrepreneur, innovation and technology in the entrepreneurial process."),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Full course description/details"),
                  Transform.rotate(
                    angle: 370,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.attach_file_outlined,
                        color: Color(0xff999999),
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Text(
                "Click here for course registration",
                style: TextStyle(color: Color(0xff0091CD)),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 10, right: 5, bottom: 10, top: 10),
                child: Text(
                  "Level 2",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                decoration: BoxDecoration(color: Color(0xff0091CD)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "The CIE Intermediate Entrepreneurship – Level 2 (or the CIE L2) course emphasizes deploying the mindset, business acumen gained in the CIE L1 course and implementing it through action."),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Full course description/details"),
                  Transform.rotate(
                    angle: 370,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.attach_file_outlined,
                        color: Color(0xff999999),
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Text(
                "Click here for course registration",
                style: TextStyle(color: Color(0xff0091CD)),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
