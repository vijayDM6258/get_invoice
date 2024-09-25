import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'mapp.dart';

class pdfff extends StatefulWidget {
  List<Map<String, dynamic>> items = [];
  String Name;
  String phoneno;
  String CompanyName;
  String postalcode;
  String Address;

  pdfff(
      {required this.items,
      required this.Address,
      required this.postalcode,
      required this.CompanyName,
      required this.phoneno,
      required this.Name,
      Key? key})
      : super(key: key);

  @override
  State<pdfff> createState() => _pdfffState();
}

class _pdfffState extends State<pdfff> {
  int sum = 0;
  @override
  void initState() {
    super.initState();

    for (int i = 0; i < items.length; i++) {
      print(items[i]);
      int ii = int.parse(items[i]['quantity'] ?? "");
      sum = ((sum + ii));
    }
    print(sum);
    print("100");
  }

  @override
  Widget build(BuildContext context) {
    print(items.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice generator"),
      ),
      body: PdfPreview(
        build: (PdfPageFormat format) {
          return genpdf();
        },
      ),
    );
  }

  genpdf() {
    final pdf = pw.Document();

    var paage = pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              // mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
              children: [
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Container(
                          child: pw.Column(children: [
                        pw.Text("xyz's Factory",
                            style: pw.TextStyle(fontSize: 25)),
                        pw.SizedBox(height: 8),
                      ])),
                      pw.SizedBox(width: 30),
                      pw.Text("INVOICE",
                          style: pw.TextStyle(
                            fontSize: 40,
                            color: PdfColors.grey,
                          ))
                    ]),
                pw.SizedBox(height: 25),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Container(
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                            pw.Text("Rajkot",
                                style: pw.TextStyle(fontSize: 18)),
                            pw.Text("Rajkot , 360001",
                                style: pw.TextStyle(fontSize: 18)),
                            pw.Text("123456789",
                                style: pw.TextStyle(fontSize: 18))
                          ])),
                      pw.Container(
                          child: pw.Column(children: [
                        pw.Text("INVOICE NO. : 1",
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold)),
                        pw.Text("DATE : 9 May, 2000",
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold))
                      ]))
                    ]),
                pw.SizedBox(height: 25),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Container(
                          child: pw.Column(children: [
                        pw.Text("Billing Address : ",
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 18)),
                        pw.Text("xyz's Factory",
                            style: pw.TextStyle(fontSize: 18)),
                        pw.Text("main road ",
                            style: pw.TextStyle(fontSize: 18)),
                        pw.Text("Hospital Road,",
                            style: pw.TextStyle(fontSize: 18)),
                        pw.Text("360001", style: pw.TextStyle(fontSize: 18)),
                        pw.Text("1234567890",
                            style: pw.TextStyle(fontSize: 18)),
                      ])),
                      pw.Container(
                          child: pw.Column(children: [
                        pw.Text("Delivery Address : ",
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 18)),
                        pw.Text(widget.Name, style: pw.TextStyle(fontSize: 18)),
                        pw.Text(widget.CompanyName,
                            style: pw.TextStyle(fontSize: 18)),
                        pw.Text(widget.Address,
                            style: pw.TextStyle(fontSize: 18)),
                        pw.Text(widget.postalcode,
                            style: pw.TextStyle(fontSize: 18)),
                        pw.Text(widget.phoneno,
                            style: pw.TextStyle(fontSize: 18)),
                      ]))
                    ]),
                pw.SizedBox(height: 50),
                pw.Row(
                    // mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Container(
                          height: 35,
                          width: 125,
                          alignment: pw.Alignment.center,
                          child: pw.Text("Name",
                              style: pw.TextStyle(
                                  fontSize: 17,
                                  fontWeight: pw.FontWeight.bold)),
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(
                                  color: PdfColors.black, width: 3))),
                      pw.Container(
                          height: 35,
                          width: 125,
                          alignment: pw.Alignment.center,
                          child: pw.Text("DESCRIPTION",
                              style: pw.TextStyle(
                                  fontSize: 17,
                                  fontWeight: pw.FontWeight.bold)),
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(
                                  color: PdfColors.black, width: 3))),
                      pw.Container(
                          height: 35,
                          width: 125,
                          alignment: pw.Alignment.center,
                          child: pw.Text("UNIT PRICE",
                              style: pw.TextStyle(
                                  fontSize: 17,
                                  fontWeight: pw.FontWeight.bold)),
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(
                                  color: PdfColors.black, width: 3))),
                      pw.Container(
                          height: 35,
                          width: 125,
                          alignment: pw.Alignment.center,
                          child: pw.Text("AMOUNT",
                              style: pw.TextStyle(
                                  fontSize: 17,
                                  fontWeight: pw.FontWeight.bold)),
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(
                                  color: PdfColors.black, width: 3)))
                    ]),
                pw.Row(
                    // mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.ListView.builder(
                          itemBuilder: (context, index) {
                            return pw.Row(
                                // mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                                children: [
                                  pw.Container(
                                      height: 35,
                                      width: 125,
                                      alignment: pw.Alignment.center,
                                      child: pw.Text(items[index]['itemm'],
                                          style: pw.TextStyle(fontSize: 15)),
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all(
                                              color: PdfColors.black,
                                              width: 3))),
                                  pw.Container(
                                      height: 35,
                                      width: 125,
                                      alignment: pw.Alignment.center,
                                      child: pw.Text(items[index]['quantity'],
                                          style: pw.TextStyle(fontSize: 13)),
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all(
                                              color: PdfColors.black,
                                              width: 3))),
                                  pw.Container(
                                      height: 35,
                                      width: 125,
                                      alignment: pw.Alignment.center,
                                      child: pw.Text(items[index]['Rate'],
                                          style: pw.TextStyle(fontSize: 15)),
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all(
                                              color: PdfColors.black,
                                              width: 3))),
                                  pw.Container(
                                      height: 35,
                                      width: 125,
                                      alignment: pw.Alignment.center,
                                      child: pw.Text(
                                          "${int.parse(items[index]['Rate']) * int.parse(items[index]['quantity'])}",
                                          style: pw.TextStyle(fontSize: 15)),
                                      decoration: pw.BoxDecoration(
                                          border: pw.Border.all(
                                              color: PdfColors.black,
                                              width: 3))),
                                ]);
                          },
                          itemCount: items.length)
                    ]),
                pw.Row(//mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                  pw.SizedBox(width: 374),
                  pw.Container(
                      height: 50,
                      width: 126,
                      child: pw.Center(
                        child:
                            pw.Text("$sum", style: pw.TextStyle(fontSize: 30)),
                      ),
                      decoration: pw.BoxDecoration(
                          border:
                              pw.Border.all(color: PdfColors.black, width: 3)))
                ])
              ]);
        });
    pdf.addPage(paage);
    return pdf.save();
  }
}
