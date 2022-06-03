import 'dart:developer';

import 'package:flutter/material.dart';

sideNavAppBar(String title) {
  return AppBar(
    backgroundColor: Color(0xff0091CD),
    titleSpacing: 0,
    leading:   Container(

      child: IconButton(
        icon: Icon(Icons.arrow_back_ios_outlined),
        onPressed: () {},
      ),
    ),
    title: Row(
      children: [

        Text("$title"),
      ],
    ),
  );
}

