import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:goalship/signin.dart';

import 'HomePage.dart';
import 'Settings.dart';

class ProfileSettings extends StatefulWidget {
  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

List<String> imageLink = [
  'user_male.png',
  'user_male_adult.png',
  'user_female.png',
  'user_female_adult.png',
];

Image? iconReturner(int age, String Gender) {
  if (age < 23 && Gender == 'Male')
    return Image(
      image: AssetImage('assets/$imageLink[0]'),
      height: 80.0,
      width: 80.0,
    );
  if (age < 23 && Gender == 'Female')
    return Image(
      image: AssetImage('assets/$imageLink[2]'),
      height: 80.0,
      width: 80.0,
    );
  if (age >= 23 && Gender == 'Male')
    return Image(
      image: AssetImage('assets/$imageLink[1]'),
      height: 80.0,
      width: 80.0,
    );
  if (age >= 23 && Gender == 'Female')
    return Image(
      image: AssetImage('assets/$imageLink[3]'),
      height: 80.0,
      width: 80.0,
    );
  else
    return Image(image: AssetImage('assets/user.png'));
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeColour,
        elevation: 0.0,
        leading: TextButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: FaIcon(
            Icons.arrow_back_ios,
            color: TextColour,
            size: 25.0,
          ),
        ),
        titleSpacing: -5.0,
        title: Text(
          "Profile Settings",
          style: TextStyle(
              color: TextColour, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                height: 200.0,
                width: 240.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: themeColour.withOpacity(0.5),
                        radius: 60.0,
                        child: iconReturner(ageUser, gender),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          userName,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          )
        ],
      ),
    );
  }
}
