import 'package:flutter/material.dart';

import 'package:move_to_desktop/move_to_desktop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _moveToDesktopPlugin = MoveToDesktop();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: TextButton(child: const Text('move_to_desktop'),onPressed: ()async{
           await _moveToDesktopPlugin.moveToDesktop();
          },),
        ),
      ),
    );
  }
}
