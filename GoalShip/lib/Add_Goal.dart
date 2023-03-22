import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:goalship/Settings.dart';
import 'package:bottom_drawer/bottom_drawer.dart';
import 'Friends.dart';
import 'HomePage.dart';

class Add_Goal extends StatefulWidget {
  @override
  State<Add_Goal> createState() => _Add_GoalState();
}

class _Add_GoalState extends State<Add_Goal> {
  String Hobby_name = "";
  TextEditingController hobbyName = TextEditingController();
  bool switch_state = false;

  double _headerHeight = 60.0;
  double _bodyHeight = 900.0;
  BottomDrawerController _controller = BottomDrawerController();

  void onChanged(bool val) {
    setState(() {
      switch_state = !val;
    });
  }

  // TextEditingController hobbyDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BottomDrawer(
      header: _buildBottomDrawerHead(context),
      body: _buildBottomDrawerBody(context),
      headerHeight: _headerHeight,
      drawerHeight: _bodyHeight,
      color: Colors.lightBlue,
      controller: _controller,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 60,
          spreadRadius: 5,
          offset: const Offset(2, -6), // changes position of shadow
        ),
      ],
    );
  }

  Widget _buildBottomDrawerHead(BuildContext context) {
    return Container(
      height: _headerHeight,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 165.0),
                  child: Text("Header"),
                ),
                IconButton(
                    onPressed: () {
                      _controller.close();
                    },
                    icon: Icon(Icons.close))
              ],
            ),
          ),
          Spacer(),
          Divider(
            height: 1.0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomDrawerBody(BuildContext context) {
    return Container(
      width: double.infinity,
      height: _bodyHeight,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all()),
              child: TextFormField(
                controller: hobbyName,
              ),
            ),
            Text(
              "Choose the duration",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(child: Reusable_card('21 Days')),
                Expanded(child: Reusable_card('50 Days')),
                Expanded(child: Reusable_card('90 Days')),
              ],
            ),
            Text(
              "Choose frequency",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(child: Reusable_card('Daily')),
                Expanded(child: Reusable_card('Weekly')),
                Expanded(child: Reusable_card('Monthly')),
              ],
            ),
            Text(
              "Choose frequency",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Reusable_card('Mon'),
                  Reusable_card('Tue'),
                  Reusable_card('Wed'),
                  Reusable_card('Thu'),
                  Reusable_card('Fri'),
                  Reusable_card('Sat'),
                  Reusable_card('Sun'),
                ],
              ),
            ),
            Container(
              height: 40.0,
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20.0)),
              child: TextButton(
                onPressed: () {},
                child: Center(child: Text("Everyday")),
              ),
            ),
            Text(
              "Notification",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notifications"),
                  CupertinoSwitch(
                      value: switch_state,
                      onChanged: (value) => onChanged(switch_state)),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.green[100],
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    Hobby_name = hobbyName.text;
                    UserHobbyList.add(
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.all(10.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  child: FaIcon(FontAwesomeIcons.check),
                                ),
                                Text(
                                  "$Hobby_name",
                                  style: TextStyle(
                                      color: Colors.black26, fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                    count++;
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  });
                },
                child: Text(
                  "Confirm",
                  style: TextStyle(color: Colors.deepOrangeAccent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Reusable_card extends StatelessWidget {
  Reusable_card(this.days);

  final String days;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
      ),
      height: 50.0,
      width: 70.0,
      child: Center(
        child: TextButton(
          onPressed: () {
            MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.greenAccent;
              }
              return Colors.blue;
            });
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((state) {
            if (state.contains(MaterialState.pressed)) {
              return Colors.amber;
            }
            return Colors.greenAccent;
          })),
          child: Text(
            days,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

/*
Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all()),
              child: TextFormField(
                controller: hobbyName,
              ),
            ),
            Text(
              "Choose the duration",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(child: Reusable_card('21 Days')),
                Expanded(child: Reusable_card('50 Days')),
                Expanded(child: Reusable_card('90 Days')),
              ],
            ),
            Text(
              "Choose frequency",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(child: Reusable_card('Daily')),
                Expanded(child: Reusable_card('Weekly')),
                Expanded(child: Reusable_card('Monthly')),
              ],
            ),
            Text(
              "Choose frequency",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Reusable_card('Mon'),
                  Reusable_card('Tue'),
                  Reusable_card('Wed'),
                  Reusable_card('Thu'),
                  Reusable_card('Fri'),
                  Reusable_card('Sat'),
                  Reusable_card('Sun'),
                ],
              ),
            ),
            Container(
              height: 40.0,
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20.0)),
              child: TextButton(
                onPressed: () {},
                child: Center(child: Text("Everyday")),
              ),
            ),
            Text(
              "Notification",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notifications"),
                  CupertinoSwitch(
                      value: switch_state,
                      onChanged: (value) => onChanged(switch_state)),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.green[100],
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    Hobby_name = hobbyName.text;
                    UserHobbyList.add(
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.all(10.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  child: FaIcon(FontAwesomeIcons.check),
                                ),
                                Text(
                                  "$Hobby_name",
                                  style: TextStyle(
                                      color: Colors.black26, fontSize: 20.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                    count++;
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  });
                },
                child: Text(
                  "Confirm",
                  style: TextStyle(color: Colors.deepOrangeAccent),
                ),
              ),
            ),
          ],
        ),
 */
