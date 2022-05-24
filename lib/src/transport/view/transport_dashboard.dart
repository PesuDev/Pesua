import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pesu/src/transport/view/ec_campus.dart';
import 'package:pesu/src/transport/view/rr_campus.dart';
import 'package:pesu/utils/view/widget.dart';

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

  setState(() {

  });
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

appBar: AppBar(
  title: Text("Settings"),
  bottom:PreferredSize(
    preferredSize:
    new Size(MediaQuery.of(context).size.width, 50.0),
    child:Container(
      color: Colors.blueAccent,
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
        drawer: Container(),
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
