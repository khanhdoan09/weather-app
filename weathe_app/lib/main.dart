import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weathe_app/home.dart';
import 'package:weathe_app/sidebar.dart';
import 'package:weathe_app/weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomeState(),
    );
  }
}
class MyHomeState extends StatefulWidget {
   @override
   _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomeState>{
  @override
  Widget build(BuildContext) {
    return Scaffold(
      body: HomeView(),
    );
  }
}

