import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:flutter_pdf/views/full_file.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyPage(),
  ));
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Örneği"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          child: Text("Pdf Oluştur"),
          onPressed: () {
            orderPdfView(context, "Hello World");
          },
        ),
      ),
    );
  }
}

class PdfViewer extends StatelessWidget {
  final String path;
  PdfViewer({this.path});

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      path: path,
    );
  }
}
