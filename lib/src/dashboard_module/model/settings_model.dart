import 'package:flutter/cupertino.dart';

class SettingsModel{
  String? name;
  IconData? icon;
  Function? callback;
  String? routeData;

  SettingsModel({this.name,this.callback,this.icon,this.routeData});
}