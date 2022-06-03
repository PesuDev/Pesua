import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:pesu/utils/constants/color_consts.dart';
import 'package:pesu/utils/view/app_drawer_screen.dart';
import 'package:pesu/utils/view/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _mainHeight;
  var _mainWidth;

  List<String> imageList = [
    'https://scx2.b-cdn.net/gfx/news/2019/2-nature.jpg',
    'https://insideclimatenews.org/wp-content/uploads/2021/09/whanganui-river_matthew-lovette-education-images-universal-images-group-getty-scaled.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    _mainHeight = MediaQuery.of(context).size.height;
    _mainWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: appThemeColor,
        title: Text(
          'PES University',
        ),
      ),
      body: Container(
        height: _mainHeight,
        width: _mainWidth,
        color: Colors.white,
        padding: EdgeInsets.only(
          top: _mainHeight * 0.00,
          bottom: _mainHeight * 0.015,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getDrawerDetails(context: context),
            SizedBox(
              height: _mainHeight*0.01,
            ),
            Container(
              color: Colors.blueGrey.shade50,
              padding: EdgeInsets.only(left:_mainWidth*0.02,right:_mainWidth*0.02,top: _mainHeight*0.01),
              margin: EdgeInsets.only(left: _mainWidth*0.03,right: _mainWidth*0.03),
              height: _mainHeight*0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getStudentLinks(
                      icon: Icon(Icons.wysiwyg),
                      color: Colors.blueAccent.shade100,
                      text: 'My Courses',
                      callback: () {}),
                  getStudentLinks(
                      icon: Icon(Icons.archive),
                      color: Colors.orange.shade100,
                      text: 'ISA Results',
                      callback: () {}),
                  getStudentLinks(
                      icon: Icon(Icons.date_range),
                      color: Colors.lightGreen.shade100,
                      text: 'Attendance',
                      callback: () {}),
                  getStudentLinks(
                      icon: Icon(Icons.view_week),
                      color: Colors.lightBlueAccent.shade100,
                      text: 'Seating Info',
                      callback: () {})
                ],
              ),
            ),
            SizedBox(
              height: _mainHeight*0.01,
            ),

            Container(
              height: _mainHeight * 0.2,
              padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.05),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                imageList[index],
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                            width: _mainWidth,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            ),
                            height: 30,
                            child: Text(
                              "Invitation to Participate in an Event",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )),
                      )
                    ],
                  );
                },
                autoplay: true,
                itemCount: imageList.length,
              ),
            ),
            SizedBox(
              height: _mainHeight * 0.03,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.05),
                child: Text(
                  'Important Announcements (2/4)',
                  style: TextStyle(color: appThemeContrastColor),
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.03),
              height: _mainHeight * 0.1,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.ac_unit,
                      size: 24,
                      color: appThemeContrastColor,
                    ),
                    title: Text(
                      'Department of Computer Science & Technology',
                      style: TextStyle(
                        color: headingColor,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      'Date : 24-May-2022',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  );
                },
                autoplay: true,
                itemCount: 4,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.05),
              alignment: Alignment.centerLeft,
              height: _mainHeight * 0.04,
              color: Colors.grey.shade200,
              child: Text(
                'Announcements (1)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.05),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.ac_unit,
                  size: 24,
                  color: appThemeContrastColor,
                ),
                title: Text(
                  'Department of Computer Science & Technology',
                  style: TextStyle(
                    color: headingColor,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  'Date : 24-May-2022',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            )
          ],
        ),
      ),
      drawer: AppDrawerScreen(),
    );
  }

  Widget getStudentLinks(
      {required Icon icon,
      required Color color,
      required String text,
      required Function callback}) {
    return GestureDetector(
      onTap: () => callback(),
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: color,
            child: icon,
          ),
          SizedBox(height: 5,),
          Text(text)
        ],
      ),
    );
  }
  Widget getDrawerDetails({required BuildContext context}) {
    return Container(

      height: _mainHeight * 0.05,
      color: Colors.white,
      margin: EdgeInsets.only(left: _mainWidth * 0.05,right: _mainWidth*0.05,top: _mainHeight*0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.height * 0.025,
            backgroundImage: NetworkImage(
                'https://media.springernature.com/full/springer-cms/rest/v1/img/18893370/v1/height/320'),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Container(
            width: _mainWidth * 0.75,
            child: Column(
            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deepak Kr',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black),
                ),
                SizedBox(height: 5,),
                Text('SRN : PES12345678', style: getTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
  TextStyle get getTextStyle => TextStyle(
      fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w400);
}
