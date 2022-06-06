import 'package:flutter/cupertino.dart';

class SettingsModel{
  String? name;
  IconData? icon;
  Function? callback;

  SettingsModel({this.name,this.callback,this.icon});
}