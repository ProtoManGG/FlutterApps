import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'routes/app_pages.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AudBot',
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.pages,
    );
  } 
}
