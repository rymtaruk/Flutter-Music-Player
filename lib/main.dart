import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/Screens/main_screen.dart';

import 'Setup.dart';

void main() {
  configureDependencies();
  runZonedGuarded(
      () => runApp(const MyApp()
          // MyApp()
          ), (error, stackTrace) async {
    if (kDebugMode) {
      print(error.toString());
      print(stackTrace.toString());
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
