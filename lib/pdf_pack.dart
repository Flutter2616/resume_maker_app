import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p;
import 'modal_class.dart';//object of librery file

Future<Uint8List> PDF(Data d) async {
  var pdf = p.Document();
  pdf.addPage(
    p.Page(
      margin: p.EdgeInsets.all(10),
      orientation: p.PageOrientation.portrait,
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return p.Padding(
          padding: const p.EdgeInsets.all(10.0),
          child: p.Expanded(
              child: p.Container(
                width: double.infinity,
                height: 780,
                child: p.Row(
                  children: [
                    p.Container(
                      width: 180,
                      decoration: p.BoxDecoration(
                        color: PdfColors.blueGrey900,
                      ),
                      child: p.Column(
                        crossAxisAlignment: p.CrossAxisAlignment.start,
                        children: [
                          p.SizedBox(height: 15),
                          p.Padding(
                            padding: const p.EdgeInsets.all(10.0),
                            child: p.Container(
                              height: 170,
                              width: 150,
                              color: PdfColors.black,
                              child: p.Image(p.MemoryImage(File("${d.path}").readAsBytesSync()),fit: p.BoxFit.fill),
                            ),
                          ),
                          p.SizedBox(height: 10),
                          p.Text(
                            "${d.name}",
                            style: p.TextStyle(
                                color: PdfColors.white,
                                fontWeight: p.FontWeight.bold,
                                fontSize: 30),
                          ),
                          p.SizedBox(height: 25),
                          box("Field", PdfColors.white, PdfColors.purple),
                          p.SizedBox(height: 15),
                          p.Text(
                            "${d.des}",
                            style: p.TextStyle(
                                color: PdfColors.white,
                                fontWeight: p.FontWeight.bold,
                                fontSize: 20),
                          ),
                          p.SizedBox(height: 30),
                          box("Contact", PdfColors.white, PdfColors.purple),
                          p.SizedBox(height: 20),
                          contact(
                              data: "${d.con}",size:  18),
                          p.SizedBox(height: 20),
                          contact(data: "${d.add}", size:  18),
                          p.SizedBox(height: 20),
                          contact(
                              data: "${d.email}",size:  15),
                          p.SizedBox(height: 30),
                          box("Language", PdfColors.white, PdfColors.purple),
                          p.SizedBox(height: 10),
                          p.Column(
                            crossAxisAlignment: p.CrossAxisAlignment.start,
                            children: d.boli!.map((e) => p.Text("-$e", style: p.TextStyle(
                                color: PdfColors.white,
                                fontWeight: p.FontWeight.bold,
                                fontSize: 20),)).toList(),
                          ),
                        ],
                      ),
                    ),
                    p.Expanded(
                      child: p.Container(
                        width: 200,
                        decoration: p.BoxDecoration(
                          color: PdfColors.purple100,
                        ),
                        child: p.Padding(
                          padding: const p.EdgeInsets.symmetric(horizontal: 8.0),
                          child: p.Column(
                            crossAxisAlignment: p.CrossAxisAlignment.start,
                            children: [
                              p.SizedBox(height: 15),
                              box("OBJECTIVE", PdfColors.blueGrey700,
                                  PdfColors.white),
                              p.SizedBox(height: 10),
                              p.Container(
                                width: 200,
                                alignment: p.Alignment.center,
                                child: p.Text(
                                  "${d.obj}",
                                  style: p.TextStyle(
                                      fontSize: 20,
                                      color: PdfColors.black,
                                      fontWeight: p.FontWeight.bold),
                                ),
                              ),
                              p.SizedBox(height: 35),
                              box("EXPIRENCE", PdfColors.blueGrey700,
                                  PdfColors.white),
                              p.SizedBox(height: 10),
                              p.Text(
                                "${d.work}",
                                style: p.TextStyle(
                                    fontSize: 20,
                                    color: PdfColors.black,
                                    fontWeight: p.FontWeight.bold),
                              ),
                              p.SizedBox(height: 35),
                              box("Ex salary", PdfColors.blueGrey700,
                                  PdfColors.white),
                              p.SizedBox(height: 10),
                              p.Text(
                                "${d.rangeValues?.start}-${d.rangeValues?.end}",style: p.TextStyle(
                                  fontSize: 20,
                                  color: PdfColors.black,
                                  fontWeight: p.FontWeight.bold),),
                              p.SizedBox(height: 35),
                              box("EDUCATION", PdfColors.blueGrey700,
                                  PdfColors.white),
                              p.SizedBox(height: 10),
                              p.Text(
                                "${d.edu}",
                                style: p.TextStyle(
                                    fontSize: 25,
                                    color: PdfColors.black,
                                    fontWeight: p.FontWeight.bold),
                              ),
                              p.SizedBox(height: 10),
                              p.Text(
                                "${d.seluni}",
                                style: p.TextStyle(
                                    fontSize: 25,
                                    color: PdfColors.black,
                                    fontWeight: p.FontWeight.bold),
                              ),
                              p.SizedBox(height: 35),
                              box("SKILLS", PdfColors.blueGrey700,
                                  PdfColors.white),
                              p.SizedBox(height: 10),
                              p.Container(
                                width: 200,
                                child: p.Text(
                                  "${d.skill}",
                                  style: p.TextStyle(
                                      fontSize: 20,
                                      color: PdfColors.black,
                                      fontWeight: p.FontWeight.bold),
                                ),
                              ),
                              p.SizedBox(height: 20),
                              box("HOBBIES", PdfColors.blueGrey700,
                                  PdfColors.white),
                              p.SizedBox(height: 10),
                              p.Container(
                                width: 200,
                                child: p.Text(
                                  "${d.hobbies}",
                                  style: p.TextStyle(
                                      fontSize: 20,
                                      color: PdfColors.black,
                                      fontWeight: p.FontWeight.bold),
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
        );
      },
    ),
  );

  return await pdf.save();

}

p.Widget box(String title, PdfColor c1, PdfColor textc) {
  return p.Container(
    height: 50,
    width: 170,
    alignment: p.Alignment.center,
    child: p.Text("$title",
        style: p.TextStyle(
            fontSize: 25, fontWeight: p.FontWeight.bold, color: textc)),
    decoration: p.BoxDecoration(color: c1),
  );
}

p.Widget contact({p.Icon? i1, String? data, double? size}) {
  return p.Row(
    children: [
      p.SizedBox(width: 10),
      p.Container(
          width: 130,
          child: p.Text("$data",
              style: p.TextStyle(color: PdfColors.white, fontSize: size))),
    ],
  );
}
