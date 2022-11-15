import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'color_consts.dart';
class CustomWidgets{
  static void showLoaderDialog({required BuildContext context, required String message}) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
              valueColor:AlwaysStoppedAnimation<Color>(Colors.blue)),
          SizedBox(width: 5,),
          Container(
              child: Text('$message...',style: TextStyle(fontFamily: 'Nunito'),)),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(child: alert, onWillPop: ()async=>false);
      },
    );
  }
  static void showLoaderDialogWithoutText({required BuildContext context}) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      content:
      Center(
            child: CircularProgressIndicator(
                valueColor:AlwaysStoppedAnimation<Color>(Color(0xff0091CD))),
          ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(child: alert, onWillPop: ()async=>false);
      },
    );
  }
  static void getToast({required String message, required Color color}) {
    Fluttertoast.showToast(
        msg: message,

        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }



  static const colorizeColors = [
    Colors.black,
    Color(0xff7AB02A),
    Colors.black,
    Color(0xff7AB02A),

  ];
  static const colorizeTextStyle = TextStyle(
    fontSize: 14.0,
    fontFamily: 'Horizon',
  );

  static void libraryUrl(){
       launch("http://library.pes.edu");

   }
   static   webUrl(){
     return  launch("https://www.pesuacademy.com/Academy/");

   }

 static  List<BottomNavigationBarItem> getNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
            color: Colors.black54,
          ),
          label: 'HOME',
          backgroundColor: Colors.green.shade50,
          activeIcon: Icon(
            Icons.home_outlined,
            color: appThemeColor,
          )),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.wysiwyg_outlined,
            color: Colors.black54,
          ),
          label: 'MY COURSES',
          activeIcon: Icon(
            Icons.wysiwyg_outlined,
            color: appThemeColor,
          )),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.add_chart,
            color: Colors.black54,
          ),
          label: 'ISA RESULTS',
          activeIcon: Icon(
            Icons.add_chart,
            color: appThemeColor,
          )),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.access_time,
            color: Colors.black54,
          ),
          label: 'ATTENDANCE',
          activeIcon: Icon(
            Icons.access_time,
            color: appThemeColor,
          )),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.menu,
          color: Colors.black54,
        ),
        label: 'MENU',
        activeIcon: Icon(
          Icons.menu,
          color: appThemeColor,
        ),
      ),
    ];
  }



}