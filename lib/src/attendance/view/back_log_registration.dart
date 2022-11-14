import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pesu/utils/constants/custom_widgets.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color_consts.dart';
import '../../../utils/services/bottom_navigaton_provider.dart';
import '../../dashboard_module/view/dashboard_page.dart';

class BackLogRegistration extends StatefulWidget {
  const BackLogRegistration({Key? key}) : super(key: key);

  @override
  State<BackLogRegistration> createState() => _BackLogRegistrationState();
}

class _BackLogRegistrationState extends State<BackLogRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: sideNavAppBar("Backlog Registration"),
     // drawer: Container(),
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
body:
Center(
  child:   Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            CustomWidgets.webUrl();
          },
          child: Container(
            width: MediaQuery.of(context).size.width/1.1,
            child:


            RichText(
              maxLines: 3,
                text: TextSpan(
              text: "Backlog/Improvement Registration option available only on student web portal, please visit ",
                style: TextStyle(color: Colors.black),

                children: [
                TextSpan(
                  text :"pesuacademy.com",
                  style: TextStyle(color: Colors.blue),
                  //onEnter: CustomWidgets.webUrl(),

                ),
                  TextSpan(
                  text :" for registration",
                  style: TextStyle(color: Colors.black),
                )

              ]
            )),
          ),
        )

      ],
    ),
  ),
),
    );
  }
}
