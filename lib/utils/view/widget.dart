import 'dart:developer';

import 'package:flutter/material.dart';

sideNavAppBar(String title) {
  return AppBar(
    backgroundColor: Color(0xff0091CD),
    titleSpacing: 0,
    leading:   BackButton(),
    title: Row(
      children: [

        Text("$title"),
      ],
    ),
  );
}

