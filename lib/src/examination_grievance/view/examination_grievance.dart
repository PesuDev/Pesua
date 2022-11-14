import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color_consts.dart';
import '../../../utils/constants/custom_widgets.dart';
import '../../../utils/services/bottom_navigaton_provider.dart';
import '../../dashboard_module/view/dashboard_page.dart';

class Examination extends StatefulWidget {
  const Examination({Key? key}) : super(key: key);

  @override
  State<Examination> createState() => _ExaminationState();
}

class _ExaminationState extends State<Examination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:    Consumer<BottomNavigationProvider>(
        builder: (context, value, child) {
          return BottomNavigationBar(
              currentIndex: value.selectedIndex,
              fixedColor: appThemeColor,
              items:CustomWidgets.getNavBarItems(),
              selectedFontSize: 10,
              unselectedFontSize: 10,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {

                value.selectBottomIndex(bottomIndex: index);
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => DashboardScreen()));
              }

          );
        },
      ),
      appBar: AppBar(
        title: Text("Examination Grievance Redressal Sysytem",overflow: TextOverflow.ellipsis,maxLines: 1,),
      ),
      body:   Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,bottom: 70),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Tickets-Examination Grievance Redressal System Option available only on student web portal,please visit',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,

                            fontSize: 14,
                            color: Colors.grey),),

                    TextSpan(
                        text: ' Pesuacademy.com',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.blueGrey)),
                    TextSpan(
                        text: 'for raising Tickets.',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.grey)),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
