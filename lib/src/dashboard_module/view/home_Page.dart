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
  final _swiperController = SwiperControl();
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
        padding: EdgeInsets.symmetric(

          vertical: _mainHeight * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              height: _mainHeight * 0.2,
              padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.03),
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
                      ),Positioned(
                        bottom:0,
                        child: Container(
                          width: _mainWidth,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 30,
                            child: Text(
                              "Invitation to Participate in an Event",
                              style: TextStyle(fontSize: 16, color: Colors.white),
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
              height: _mainHeight*0.03,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.03),
                child: Text('Important Announcements (2/4)',style: TextStyle(color: appThemeContrastColor),)),
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
              padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.03),
              alignment: Alignment.centerLeft,
              height: _mainHeight*0.04,
              color: Colors.grey.shade200,
              child: Text('Announcements (1)',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: _mainWidth * 0.03),
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
}
