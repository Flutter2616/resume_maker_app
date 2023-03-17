import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_maker_app/modal_class.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String? work;
  List lan = [false, false, false];
  TextEditingController name = TextEditingController();
  TextEditingController add = TextEditingController();
  TextEditingController con = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController obj = TextEditingController();
  TextEditingController language = TextEditingController();
  TextEditingController skill = TextEditingController();
  TextEditingController hobbies = TextEditingController();
  List stat = [
    "Gujarat",
    "Tamil nadu",
    "kolkata",
    "Haryana",
    "punjab",
    "Rajasthan",
    "Utter pradesh",
    "Odisha",
    "Madhya pradesh",
    "kerala",
    "Uttarakhand",
    "Puducherry",
    "Goa",
    "Maharashtra",
    "Nagaland",
    "Sikkim"
  ];
  List quli = [
    "B.com",
    "BScIT",
    "B.B.A",
    "B.A",
    "B.Ed",
    "BTECH",
    "Engineering",
    "M.B.B.S",
    "BCA"
  ];
  List univercity = [
    "vnsgu",
    "MS Univercity",
    "Nirma Univercity",
    "Parul Univercity",
    "Sardar Patel Univercity",
    "Bagvan Mahavir Univercity",
    "Other"
  ];
  String? select;
  String? selUni;
  String? state;
  RangeValues rangeValues = RangeValues(25000, 100000);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: close,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Resume Maker"),
            backgroundColor: Colors.purple,
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(child: Text("Help")),
                        PopupMenuItem(child: Text("Version")),
                        PopupMenuItem(child: Text("Setting")),
                        PopupMenuItem(child: Text("Term & condition")),
                        PopupMenuItem(child: Text("Log out")),
                      ],
                  color: Colors.white,
                  iconSize: 25),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ExpansionTile(
                  leading: Icon(Icons.person, color: Colors.purple, size: 28),
                  title: Text("Personal Information",
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                  collapsedBackgroundColor: Colors.purple.shade50,
                  collapsedIconColor: Colors.purple,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          field("Full Name", name),
                          SizedBox(height: 5),
                          field("Street Address", add),
                          SizedBox(height: 5),
                          field("Contact", con),
                          SizedBox(height: 5),
                          field("E-mail", email),
                          SizedBox(height: 5),
                          DropdownButton(
                            items: stat
                                .map((e) => DropdownMenuItem(
                                    child: Text("$e"), value: e))
                                .toList(),
                            value: state,
                            onChanged: (value) {
                              setState(() {
                                state = value as String;
                              });
                            },
                            isExpanded: true,
                            iconEnabledColor: Colors.purple,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                            iconSize: 30,
                            hint: Text("Select State",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                          ),
                          SizedBox(height: 5),
                          field("Objective", obj),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  leading:
                      Icon(Icons.menu_book, color: Colors.purple, size: 28),
                  title: Text("Qulification",
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                  collapsedBackgroundColor: Colors.purple.shade50,
                  collapsedIconColor: Colors.purple,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          DropdownButton(
                            items: quli
                                .map((e) => DropdownMenuItem(
                                    child: Text("$e"), value: e))
                                .toList(),
                            value: select,
                            onChanged: (value) {
                              setState(() {
                                select = value as String;
                              });
                            },
                            isExpanded: true,
                            iconEnabledColor: Colors.purple,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                            iconSize: 30,
                            hint: Text("Select Qulification",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                          ),
                          SizedBox(height: 5),
                          DropdownButton(
                            items: univercity
                                .map((e) => DropdownMenuItem(
                                    child: Text("$e"), value: e))
                                .toList(),
                            value: selUni,
                            onChanged: (value) {
                              setState(() {
                                selUni = value as String;
                              });
                            },
                            isExpanded: true,
                            iconEnabledColor: Colors.purple,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                            iconSize: 30,
                            hint: Text("Select Univercity",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(Icons.language, color: Colors.purple, size: 28),
                  title: Text("Know Language",
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                  collapsedBackgroundColor: Colors.purple.shade50,
                  collapsedIconColor: Colors.purple,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CheckboxListTile(
                            value: lan[0],
                            onChanged: (value) {
                              setState(() {
                                lan[0] = value;
                              });
                            },
                            activeColor: Colors.purple,
                            title: Text("English"),
                          ),
                          SizedBox(height: 5),
                          CheckboxListTile(
                            value: lan[1],
                            onChanged: (value) {
                              setState(() {
                                lan[1] = value;
                              });
                            },
                            activeColor: Colors.purple,
                            title: Text("Hindi"),
                          ),
                          SizedBox(height: 5),
                          CheckboxListTile(
                            value: lan[2],
                            onChanged: (value) {
                              setState(() {
                                lan[2] = value;
                              });
                            },
                            activeColor: Colors.purple,
                            title: Text("Gujarati"),
                          ),
                          SizedBox(height: 5),
                          field("Other language", language),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  leading:
                      Icon(Icons.engineering, color: Colors.purple, size: 28),
                  title: Text("Skill/Hobbies",
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                  collapsedBackgroundColor: Colors.purple.shade50,
                  collapsedIconColor: Colors.purple,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          field("Skill", skill),
                          SizedBox(height: 5),
                          field("Hobbies", hobbies),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(Icons.business_center,
                      color: Colors.purple, size: 28),
                  title: Text("Work Expirence",
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          RadioListTile(
                              value: "Expirence",
                              groupValue: work,
                              activeColor: Colors.purple,
                              onChanged: (value) {
                                setState(() {
                                  work = "Expirence";
                                });
                              },
                              title: Text("Expirence")),
                          SizedBox(height: 5),
                          RadioListTile(
                              value: "Fresher",
                              activeColor: Colors.purple,
                              groupValue: work,
                              onChanged: (value) {
                                setState(() {
                                  work = "Fresher";
                                });
                              },
                              title: Text("Fresher")),
                        ],
                      ),
                    ),
                  ],
                  collapsedBackgroundColor: Colors.purple.shade50,
                  collapsedIconColor: Colors.purple,
                ),
                ExpansionTile(
                  leading: Icon(Icons.business_center,
                      color: Colors.purple, size: 28),
                  title: Text("Expected Salary",
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          RangeSlider(
                              values: rangeValues,
                              onChanged: (value) {
                                setState(() {
                                  rangeValues = value;
                                });
                              },
                              labels: RangeLabels(
                                  "${rangeValues.start.round()}",
                                  "${rangeValues.end.round()}"),
                              activeColor: Colors.purple,
                              divisions: 18,
                              min: 10000,
                              max: 100000),
                        ],
                      ),
                    ),
                  ],
                  collapsedBackgroundColor: Colors.purple.shade50,
                  collapsedIconColor: Colors.purple,
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Submit Successfully"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating),
                    );
                    setState(() {
                      Data d1 = Data(
                          name: name.text,
                          add: add.text,
                          con: con.text,
                          email: email.text,
                          hobbies: hobbies.text,
                          language: language.text,
                          obj: obj.text,
                          skill: skill.text);
                      Navigator.pushNamed(context, 'data', arguments: d1);
                    });
                  },
                  child: Text("Submit", style: TextStyle(fontSize: 25)),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                ),
              ],
            ),
          )),
    );
  }

  Widget field(String title, TextEditingController txtdata) {
    return TextField(
        style: TextStyle(fontSize: 18),
        textInputAction: TextInputAction.next,
        controller: txtdata,
        decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple, width: 2),
            ),
            labelText: "$title"),
        cursorColor: Colors.purple);
  }

  void dialoge() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Exit"),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Are you sure to exit!"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: Text("yes"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("no"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Future<bool> close() async {
    dialoge();
    return await false;
  }
}
