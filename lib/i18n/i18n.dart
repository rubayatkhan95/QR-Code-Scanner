import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> readJson(title) async {
  final String response =
      await rootBundle.loadString('assets/i18n/language.json');
  Map<String, dynamic> mapdata = await json.decode(response);
  return (mapdata[title]['english']);
}

class I18n extends StatefulWidget {
  const I18n({Key? key}) : super(key: key);

  @override
  _I18nState createState() => _I18nState();
}

class _I18nState extends State<I18n> {
  Future<void> readJson() async {
    // final String response = await rootBundle.loadString('assets/i18n/en.json');
    // Map<String, dynamic> mapdata = await json.decode(response);
    // return (mapdata['app_title']['english']);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
