import 'package:flutter/material.dart';
import 'package:pesu/utils/constants/color_consts.dart';

class AppDrawerScreen extends StatefulWidget {
  const AppDrawerScreen({Key? key}) : super(key: key);

  @override
  State<AppDrawerScreen> createState() => _AppDrawerScreenState();
}

class _AppDrawerScreenState extends State<AppDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.3,
        child: ListView(
          children: [
            Container(
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: appThemeColor),
                accountEmail: Text('deepak4@apple.com'),
                accountName: Text('Deepak Kr'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://media.springernature.com/full/springer-cms/rest/v1/img/18893370/v1/height/320'),
                ),
              ),
            ),
            getDrawerTiles(
                context: context,
                icon: Icon(
                  Icons.assessment,
                  color: appThemeColor,
                  size: 20,
                ),
                title: 'My Courses',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icon(
                  Icons.all_inclusive,
                  color: appThemeColor,
                  size: 20,
                ),
                title: 'Examination Grievance Redressal System',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icon(
                  Icons.addchart_sharp,
                  color: appThemeColor,
                  size: 20,
                ),
                title: 'Timetable',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icon(
                  Icons.wysiwyg_outlined,
                  color: appThemeColor,
                  size: 20,
                ),
                title: 'Attendance',
                callback: () {}),
            getDrawerTiles(
                context: context,
                icon: Icon(
                  Icons.weekend_outlined,
                  color: appThemeColor,
                  size: 20,
                ),
                title: 'Assignments',
                callback: () {})
          ],
        ),
      ),
    );
  }

  Widget getDrawerTiles(
      {required BuildContext context,
      required Icon icon,
      required String title,
      required Function callback}) {
    return ListTile(
      leading: Container(
          decoration: BoxDecoration(
              color: appThemeColor.withAlpha(50),
              borderRadius: BorderRadius.circular(5)),
          height: 30,
          width: 30,
          child: icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w500
        ),
      ),
      trailing: Icon(Icons.arrow_right,size: 15,),
    );
  }
}
