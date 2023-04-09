import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Add_Goal extends StatefulWidget {
  @override
  _Add_GoalState createState() => _Add_GoalState();
}

class _Add_GoalState extends State<Add_Goal> {
  String Hobby_name = "";
  TextEditingController hobbyName = TextEditingController();
  bool switch_state = false;

  void onChanged(bool val) {
    setState(() {
      switch_state = !val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Create new Goal',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
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
        ));
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
          onPressed: () {},
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return Colors.redAccent; //<-- SEE HERE
                return Colors.greenAccent; // Defer to the widget's default.
              },
            ),
          ),
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
