import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColorLight: Colors.white,
          primaryColorDark: Colors.black,
          appBarTheme: AppBarTheme(
            color: Colors.green,
          ),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: Color(0xFFE87CE4))
              .copyWith(background: Colors.white),
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: AnimatedSplashScreen(
              splash: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "GoalShip",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Powered by",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black26),
                    ),
                    Text(
                      "Team Hashira",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              nextScreen: HomePage()),
        ));
  }
}
