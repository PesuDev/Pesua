// import 'package:flutter/material.dart';
//
// class SubCourse extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => new SubCourseState();
// }
//
// class SubCourseState extends State<SubCourse> {
//   @override
//   Widget build(BuildContext context) {
//     return new DefaultTabController(
//         length: 2,
//         child: new Scaffold(
//           appBar: AppBar(
//             title: Text("Database Management"),
//           ),
//           body: TabBar(
//             tabs: [new Text("Lunches"), new Text("Cart")],
//
//             child: new TabBarView(
//               children: <Widget>[
//                 new Column(
//                   children: <Widget>[new Text("Lunches Page")],
//                 ),
//                 new Column(
//                   children: <Widget>[new Text("Cart Page")],
//                 )
//               ],
//             ),
//           ),
//         ),
//       );
//   }
// }