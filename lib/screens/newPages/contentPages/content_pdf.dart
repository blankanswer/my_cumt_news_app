// import 'dart:async';
// import 'dart:io';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// class ContentPDF extends StatefulWidget {
//   final String url;
//   ContentPDF({Key? key, required this.url}) : super(key: key);
//
//   @override
//   State<ContentPDF> createState() => _ContentPDFState();
// }
//
// class _ContentPDFState extends State<ContentPDF> {
//   late double width;
//   final Completer<PDFViewController> _controller = Completer<PDFViewController>();
//   late double height;
//
//   // Future<String?> downloadAndSavePdf() async {
//   @override
//   Widget build(BuildContext context) {
//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
//     return SizedBox(
//       width: width *.9,
//       height: height * 8,
//       child: PDFView(
//         filePath: widget.url,
//         enableSwipe: true,
//         swipeHorizontal: true,
//         autoSpacing: false,
//         pageFling: false,
//         onError: (error) {
//           print(error.toString());
//         },
//         onPageError: (page, error) {
//           print('$page: ${error.toString()}');
//         },
//         onViewCreated: (PDFViewController pdfViewController) {
//           _controller.complete(pdfViewController);
//         },
//
//       )
//
//     );
//
//   }
// }
