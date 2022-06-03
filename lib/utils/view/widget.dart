import 'dart:developer';

import 'package:flutter/material.dart';

sideNavAppBar(String title) {
  return AppBar(
    backgroundColor: Color(0xff0091CD),
    titleSpacing: 0,
    title: Row(
      children: [
        Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () {},
          ),
        ),
        Text("$title"),
      ],
    ),
  );
}

