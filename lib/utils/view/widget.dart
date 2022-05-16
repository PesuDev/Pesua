import 'package:flutter/material.dart';

sideNavAppBar(String title){
  return  AppBar(
  titleSpacing: 0,
  title: Row(
  children: [
  Container(
  child: IconButton(icon: Icon(Icons.arrow_back_ios_outlined),
  onPressed: (){

  },

  ),
  ),
  Text("$title"),
  ],
  ),

  );
}