import 'package:EJI/settings/params.dart';
import 'package:EJI/shared/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:get/get.dart';

class EJILawScreen extends StatefulWidget {
  
   EJILawScreen({Key key}) : super(key: key);

  @override
  _EJILawScreenState createState() => _EJILawScreenState();
}

class _EJILawScreenState extends State<EJILawScreen> {
 String pdfasset = "assets/images/ejiregulations.pdf";
  PDFDocument _doc;
 
  bool isLoaded=false;
@override
  void initState() {
   _initPdf();
    super.initState();
  }

   _initPdf() async {
    setState(() {
      isLoaded = true;
    });
  await PDFDocument.fromAsset(pdfasset).then((value) {
       setState(() {
      _doc=value;
      isLoaded = true;
    }); 
    });
   
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          'EJILaw'.tr,
          style: maintext3,
        ),
      ),
      backgroundColor: primaryColor,
      body:!isLoaded ? Center(child: CircularProgressIndicator(),) : PDFViewer(document: _doc, 
      indicatorBackground: accentColor2,
      // showIndicator: false,
      // showPicker: false,
       ),
    );
  }
}
