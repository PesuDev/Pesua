import 'dart:developer';

import 'package:flutter/material.dart';

sideNavAppBar(String title) {
  return AppBar(
    backgroundColor: Color(0xff0091cd),
    titleSpacing: 0,
    elevation: 0,
    leading:   BackButton(),
    title: Row(
      children: [

        Text("$title"),
      ],
    ),
  );
}



sideNavAppBarForDashboard( String title) {
  return AppBar(
    backgroundColor: Color(0xff0091CD),
    titleSpacing: 0,
    leading:   Padding(
      padding: const EdgeInsets.only(right: 10.1),
    ),
    title: Row(
      children: [

        Text("$title"),
      ],
    ),
  );
}