import 'package:flutter/material.dart';
import 'package:mycrypto/home.dart';
import 'package:mycrypto/theme/themechange.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Cryptocurrency',
      themeMode: ThemeMode.system,
      theme: MyTheme.liteTheme,
      darkTheme: MyTheme.darkTheme,

      home: Home(),
    );
  }
}

