import 'package:flutter/material.dart';
import 'package:resume_maker_app/modal_class.dart';

class Resumescreen extends StatefulWidget {
  const Resumescreen({Key? key}) : super(key: key);

  @override
  State<Resumescreen> createState() => _ResumescreenState();
}

class _ResumescreenState extends State<Resumescreen> {
  @override
  Widget build(BuildContext context) {
    Data d = ModalRoute.of(context)!.settings.arguments as Data;
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
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text("Name", "${d.name}"),
            text("Address", "${d.add}"),
            text("contact", "${d.con}"),
            text("E mail", "${d.email}"),
            text("Objective", "${d.obj}"),
            text("Language", "${d.language}"),
            text("Skill", "${d.skill}"),
            text("Hobbies", "${d.hobbies}"),
            text("State", "${d.state}"),
            text("Univercity", "${d.seluni}"),
            text("Education", "${d.edu}"),
            text("Work", "${d.work}"),
          ],
        ),
      ),
    );
  }

  Widget text(String title, String detail) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "$title = ",style: TextStyle(fontSize: 28,color: Colors.purple)),
          TextSpan(text: "$detail",style: TextStyle(fontSize: 20,color: Colors.black)),
        ],
      ),
    );
  }
}
