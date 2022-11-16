import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Container shimmerUi() {
 return Container(
   child: SizedBox(
        width: double.infinity,
        height: 200.0,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
      width: double.infinity,
            height: 200,
            color: Colors.white,
          ),
        ),

      ),
 );
  }
  Container attendanceList(){
  return  Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
    Expanded(
    child: Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,

      child: ListView.builder(
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 48.0,
                height: 48.0,
                color: Colors.white,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 8.0,
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Container(
                      width: double.infinity,
                      height: 8.0,
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Container(
                      width: 40.0,
                      height: 8.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        itemCount: 6,
      ),
    ),
  ),]
    ));
  }
// Container announcementList() {
//   return Container(
//     child: Shimmer.fromColors(
//         baseColor: Colors.grey.shade300,
//         highlightColor: Colors.grey.shade100,
//         period: const Duration(seconds: 1),
//         child: Container(
//           child: Container(
//             margin: EdgeInsets.symmetric(horizontal: 15),
//             height: 110,
//             width: double.infinity,
//             child: Column(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.only(top: 10, left: 10, right: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.white54,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(5),
//                         topRight: Radius.circular(5),
//                         bottomLeft: Radius.circular(5),
//                         bottomRight: Radius.circular(5)),
//                   ),
//                   height: 120,
//                 ),
//               ],
//             ),
//           ),
//         )),
//     // Container(
//     //   height: 50,
//     //   width: double.infinity,
//     //   decoration: BoxDecoration(
//     //     color: Color(0xff72A22C),
//     //     borderRadius: BorderRadius.only(
//     //         bottomLeft: Radius.circular(5),
//     //         bottomRight: Radius.circular(5)),
//     //   ),
//     //   child: FlatButton(
//     //     onPressed: () {},
//     //     child: Text(
//     //       "View Details",
//     //       style: TextStyle(
//     //           color: Color(0xffFFFFFF),
//     //           fontSize: 14,
//     //           fontWeight: FontWeight.w400),
//     //     ),
//     //   ),
//     // ),
//   );
// }
Container shimmerUiForProfile() {
 return Container(
   child: SizedBox(
        width: double.infinity,

        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 30,width: 50,
                child: CircleAvatar(

                ),
              ),

              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                     width: 40,
                    height: 10,
                    color: Colors.white,
                  ),
                  Container(
                    width: 60,
                    height: 10,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),

      ),
 );
  }
Container shimmerUiForAnnouncement() {
 return Container(
   child: SizedBox(
        width: double.infinity,
        height: 50.0,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
      width: double.infinity,
            height: 50,
            color: Colors.white,
          ),
        ),

      ),
 );
  }
