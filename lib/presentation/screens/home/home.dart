import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Geolocator.requestPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
