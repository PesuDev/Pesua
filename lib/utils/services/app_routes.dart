import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pesu/src/transport/view/transport_dashboard.dart';

class AppRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return data(settings);
  }
}

data(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.transport: return MaterialPageRoute(
        builder: (_) =>TransportDashboard()
    );
    case AppRoutes.attendance: return MaterialPageRoute(
        builder: (_) =>TransportDashboard()
    );
  }
  }
class AppRoutes {
  static const String transport="transport";
  static const String attendance="attendance";

}