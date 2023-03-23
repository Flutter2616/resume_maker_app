import 'dart:io';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:resume_maker_app/modal_class.dart';
import 'package:resume_maker_app/pdf_pack.dart';

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
                    PopupMenuItem(child: Text("Download PDF"),onTap: () async {
                      await Printing.layoutPdf(onLayout: (format) => PDF(d),);
                    },),
                  ],
              color: Colors.white,
              iconSize: 25),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Expanded(
            child: Container(
              width: double.infinity,
              height: 780,
              child: Row(
                children: [
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade900,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 170,
                            width: 150,
                            color: Colors.black,
                            child: Image.file(File("${d.path}"), fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${d.name}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        ),
                        SizedBox(height: 25),
                        box("Field", Colors.white, Colors.purple),
                        SizedBox(height: 15),
                        Text(
                          "${d.des}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 20),
                        ),
                        SizedBox(height: 30),
                        box("Contact", Colors.white, Colors.purple),
                        SizedBox(height: 20),
                        contact(Icon(Icons.phone, color: Colors.white),
                            "${d.con}", 18),
                        SizedBox(height: 20),
                        contact(
                            Icon(Icons.location_on_outlined,
                                color: Colors.white),
                            "${d.add}",
                            18),
                        SizedBox(height: 20),
                        contact(Icon(Icons.email_outlined, color: Colors.white),
                            "${d.email}", 15),
                        SizedBox(height: 30),
                        box("Language", Colors.white, Colors.purple),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: d.boli!.map((e) => Text("-$e", style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 20),)).toList(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            box("OBJECTIVE", Colors.blueGrey.shade700,
                                Colors.white),
                            SizedBox(height: 10),
                            Container(
                              width: 200,
                              alignment: Alignment.center,
                              child: Text(
                                "${d.obj}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(height: 35),
                            box("EXPIRENCE", Colors.blueGrey.shade700,
                                Colors.white),
                            SizedBox(height: 10),
                            Text(
                              "${d.work}",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 35),
                            box("Ex salary", Colors.blueGrey.shade700,
                                Colors.white),
                            SizedBox(height: 10),
                            Text(
                                "${d.rangeValues?.start}-${d.rangeValues?.end}",style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),),
                            SizedBox(height: 35),
                            box("EDUCATION", Colors.blueGrey.shade700,
                                Colors.white),
                            SizedBox(height: 10),
                            Text(
                              "${d.edu}",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "${d.seluni}",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 35),
                            box("SKILLS", Colors.blueGrey.shade700,
                                Colors.white),
                            SizedBox(height: 10),
                            Container(
                              width: 200,
                              child: Text(
                                "${d.skill}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(height: 20),
                            box("HOBBIES", Colors.blueGrey.shade700,
                                Colors.white),
                            SizedBox(height: 10),
                            Container(
                              width: 200,
                              child: Text(
                                "${d.hobbies}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget box(String title, Color c1, Color textc) {
    return Container(
      height: 50,
      width: 170,
      alignment: Alignment.center,
      child: Text("$title",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: textc)),
      decoration: BoxDecoration(color: c1),
    );
  }

  Widget contact(Icon i1, String data, double size) {
    return Row(
      children: [
        i1,
        SizedBox(width: 10),
        Container(
            width: 130,
            child: Text("$data",
                style: TextStyle(color: Colors.white, fontSize: size))),
      ],
    );
  }
}
