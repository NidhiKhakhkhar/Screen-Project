import 'package:flutter/material.dart';
import 'package:food_delivary/main_screen.dart';
// import 'package:food_delivary/screen_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Montserrat",
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black),
                color: Colors.white)),

        home: MainScreen());
  }
}
