import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pesu/src/transport/view/ec_campus.dart';
import 'package:pesu/src/transport/view/rr_campus.dart';
import 'package:pesu/utils/view/widget.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color_consts.dart';
import '../../../utils/constants/custom_widgets.dart';
import '../../../utils/services/bottom_navigaton_provider.dart';
import '../../dashboard_module/view/dashboard_page.dart';

class TransportDashboard extends StatefulWidget {
  const TransportDashboard({Key? key}) : super(key: key);

  @override
  _TransportDashboardState createState() => _TransportDashboardState();
}

class _TransportDashboardState extends State<TransportDashboard> with TickerProviderStateMixin{

late TabController _tabController;
void initState() {
  super.initState();
  _tabController = TabController(length: 2, vsync: this);
_tabController.addListener(() {

});
}
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 2,

      child: Scaffold(
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
  title: Text("Transport"),
  backgroundColor:    Color(0xff0091CD),
  bottom:PreferredSize(
    preferredSize:
    new Size(MediaQuery.of(context).size.width, 50.0),
    child:Container(
      color: Color(0xff163269),
      child: TabBar(

        controller: _tabController,
indicatorColor: Colors.orangeAccent,
        indicatorWeight: 3,
        tabs: [
          Tab(child: Text("RR Campus")),
      Tab(child: Text("EC Campus")),],


      ),
    ),
  ),
),
     //   drawer: Container(),
        body: Container(

child: TabBarView(
    controller: _tabController,
    children: [
RRCampus(),
      ECCampus(),
]),
        ),
      ),
    );
  }
}
