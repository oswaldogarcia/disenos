import 'package:flutter/material.dart';

import 'package:desings/src/pages/buttons_page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    //   statusBarColor: Colors.white,
    // ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desing',
      initialRoute: 'buttons',
      routes: {
        'buttons' : (BuildContext context) => ButtonsPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      )
    );
  }
}
