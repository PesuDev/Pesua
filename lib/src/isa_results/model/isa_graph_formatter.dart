import 'package:flutter/cupertino.dart';

class ISAGraphFormatterModel{

 String? x;
 Color? color;
 var y;
 ISAGraphFormatterModel({this.color,this.y,this.x});
}


// class ISAGraphFormatterModel {
//   List<Value>? value;
//
//   ISAGraphFormatterModel({this.value});
//
//   ISAGraphFormatterModel.fromJson(Map<String, dynamic> json) {
//     if (json['value'] != null) {
//       value = <Value>[];
//       json['value'].forEach((v) {
//         value!.add(new Value.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.value != null) {
//       data['value'] = this.value!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Value {
//   DataFractor? data;
//
//   Value({this.data});
//
//   Value.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new DataFractor.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class DataFractor {
//   String? xAxis;
//   String? yAxis;
//   String? color;
//
//   DataFractor({this.xAxis, this.yAxis, this.color});
//
//   DataFractor.fromJson(Map<String, dynamic> json) {
//     xAxis = json['x-axis'];
//     yAxis = json['y-axis'];
//     color = json['color'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['x-axis'] = this.xAxis;
//     data['y-axis'] = this.yAxis;
//     data['color'] = this.color;
//     return data;
//   }
// }
//
//
// // class ISAGraphFormatterModel {
// //   Data? data;
// //
// //   ISAGraphFormatterModel({this.data});
// //
// //   ISAGraphFormatterModel.fromJson(Map<String, dynamic> json) {
// //     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     if (this.data != null) {
// //       data['data'] = this.data!.toJson();
// //     }
// //     return data;
// //   }
// // }
// //
// // class Data {
// //   String? xAxis;
// //   String? yAxis;
// //   String? color;
// //
// //   Data({this.xAxis, this.yAxis, this.color});
// //
// //   Data.fromJson(Map<String, dynamic> json) {
// //     xAxis = json['x-axis'];
// //     yAxis = json['y-axis'];
// //     color = json['color'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['x-axis'] = this.xAxis;
// //     data['y-axis'] = this.yAxis;
// //     data['color'] = this.color;
// //     return data;
// //   }
// // }
