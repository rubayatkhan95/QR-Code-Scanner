// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_app/config/app_theme.dart';
import 'package:qr_code_scanner_app/config/routing_constants.dart';
import 'package:qr_code_scanner_app/routes/routes.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Code Scanner App',
      theme: appThemePrimary,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   fontFamily: "Roboto",
      // ),
      //home: const MyHomePage(title: 'ট্রাক লাগবে'),
      // home: MemberAddNew(),
      initialRoute: landing,
      onGenerateRoute: router.generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: Navbar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/dashboard');
            },
            child: Text('Next Page'),
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              elevation: 10,
            ),
          )
        ],
      ),
      backgroundColor: colorWhite,
    );
  }
}
