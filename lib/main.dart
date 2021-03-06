import 'package:flutter/material.dart';
import 'package:tokio_marine/screens/home/home_screen.dart';
import 'package:tokio_marine/screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Tokio Marine', home: LoginScreen());
  }
}
