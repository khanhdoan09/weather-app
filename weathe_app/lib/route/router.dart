import 'package:flutter/material.dart';
import 'package:weathe_app/home.dart';

import 'routing_constant.dart';
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context)=> HomeView());
    default:
          return MaterialPageRoute(builder: (context)=> HomeView());
  }
}