import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool s = false, s1 = false, s2 = false,s3=false,s4=false;
  bool work=false,fresher=false;
  List lan = [false, false, false];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ListTile(
                leading: Icon(Icons.person, color: Colors.purple, size: 28),
                title: Text("Personal Information",
                    style: TextStyle(fontSize: 18)),
                trailing: Switch(
                  value: s,
                  onChanged: (value) {
                    setState(() {
                      s = value;
                    });
                  },
                  activeColor: Colors.purple,
                ),
                tileColor: Colors.purple.shade50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: s,
                  child: Column(
                    children: [
                      field("Full Name"),
                      SizedBox(height: 5),
                      field("Street Address"),
                      SizedBox(height: 5),
                      field("Contact"),
                      SizedBox(height: 5),
                      field("E-mail"),
                      SizedBox(height: 5),
                      DropdownButton(
                        items: stat
                            .map((e) =>
                                DropdownMenuItem(child: Text("$e"), value: e))
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                      SizedBox(height: 5),
                      field("Objective"),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.menu_book, color: Colors.purple, size: 28),
                title: Text("Qulification", style: TextStyle(fontSize: 18)),
                trailing: Switch(
                  value: s1,
                  onChanged: (value) {
                    setState(() {
                      s1 = value;
                    });
                  },
                  activeColor: Colors.purple,
                ),
                tileColor: Colors.purple.shade50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: s1,
                  child: Column(
                    children: [
                      DropdownButton(
                        items: quli
                            .map((e) =>
                                DropdownMenuItem(child: Text("$e"), value: e))
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                      SizedBox(height: 5),
                      DropdownButton(
                        items: univercity
                            .map((e) =>
                                DropdownMenuItem(child: Text("$e"), value: e))
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.language, color: Colors.purple, size: 28),
                title: Text("Know Language", style: TextStyle(fontSize: 18)),
                trailing: Switch(
                  value: s2,
                  onChanged: (value) {
                    setState(() {
                      s2 = value;
                    });
                  },
                  activeColor: Colors.purple,
                ),
                tileColor: Colors.purple.shade50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: s2,
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
                      field("Other language"),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.engineering, color: Colors.purple, size: 28),
                title: Text("Skill/Hobbies", style: TextStyle(fontSize: 18)),
                trailing: Switch(
                  value: s3,
                  onChanged: (value) {
                    setState(() {
                      s3 = value;
                    });
                  },
                  activeColor: Colors.purple,
                ),
                tileColor: Colors.purple.shade50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: s3,
                  child: Column(
                    children: [
                      field("Skill"),
                      SizedBox(height: 5),
                      field("Hobbies"),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.business_center, color: Colors.purple, size: 28),
                title: Text("Work Expirence", style: TextStyle(fontSize: 18)),
                trailing: Switch(
                  value: s4,
                  onChanged: (value) {
                    setState(() {
                      s4 = value;
                    });
                  },
                  activeColor: Colors.purple,
                ),
                tileColor: Colors.purple.shade50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: s4,
                  child: Column(
                    children: [
                      CheckboxListTile(
                        value: work,
                        onChanged: (value) {
                          setState(() {
                            if(work==false)
                              {
                                work=true;
                                fresher=false;
                              }
                            work = value!;
                          });
                        },
                        activeColor: Colors.purple,
                        title: Text("Expirenace"),
                      ),
                      SizedBox(height: 5),
                      CheckboxListTile(
                        value: fresher,
                        onChanged: (value) {
                          setState(() {
                            if(fresher==false)
                            {
                              work=false;
                              fresher=true;
                            }
                            fresher = value!;
                          });
                        },
                        activeColor: Colors.purple,
                        title: Text("Fresher"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
  Widget field(String title)
  {
    return  TextField(
        style: TextStyle(fontSize: 18),textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.purple, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.purple, width: 2),
            ),
            labelText: "$title"),
        cursorColor: Colors.purple);
  }
}
