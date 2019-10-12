import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfRoutine {
  final pdf = Document();

  createPdf({String driver, String car_num, int weight}) async {
    final font = await rootBundle.load("fonts/Roboto-Regular.ttf");
    final ttf = Font.ttf(font);

    pdf.addPage(Page(
        pageFormat: PdfPageFormat.a4,
        build: (Context context) {
          return Column(

            children: <Widget>[
              Text("Водитель: $driver", style: TextStyle(font: ttf, fontSize: 30)),
              Text("Госномер: $car_num", style: TextStyle(font: ttf, fontSize: 30)),
              Text("Вес: $weight", style: TextStyle(font: ttf, fontSize: 30)),
            ],
          );
        }));
    savePDFfile();
  }

  savePDFfile() async {
    final output =
    await getExternalStorageDirectory(); // use the [path_provider (https://pub.dartlang.org/packages/path_provider) library:
    print(output);
    final file = File("${output.path}/example.pdf");
    await file.writeAsBytes(pdf.save());
  }
}