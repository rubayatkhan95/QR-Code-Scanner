// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_app/config/routing_constants.dart';
import 'package:qr_code_scanner_app/ui/widgets/avatar.dart';
import 'package:qr_code_scanner_app/ui/widgets/button.dart';
import '../../../config/app_theme.dart';

class QRCodeScannerDashboard extends StatefulWidget {
  const QRCodeScannerDashboard({Key? key}) : super(key: key);
  @override
  _QRCodeScannerDashboardState createState() => _QRCodeScannerDashboardState();
}

class _QRCodeScannerDashboardState extends State<QRCodeScannerDashboard> {
  final _formKey = GlobalKey<FormState>();
  void onPressRightIcon() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Hello User!')));
            },
          ),
        ],
      ),
      backgroundColor: colorWhite,
      body: GestureDetector(
          onTap: () {},
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _userImageView(),
                _userDetailsView(),
                _userQRCodeView(),
                _buttonView(),
              ],
            ),
          )),
    );
  }

  Widget _userImageView() {
    return Form(
        key: _formKey,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 10, right: 10, top: 40, bottom: 10),
            child: Avatar(
              color: colorBlack,
              height: 120.0,
              width: 120.0,
            )));
  }

  Widget _userDetailsView() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                "Enamul Haque Shamim",
                style: appThemePrimary.textTheme.headline6
                    ?.copyWith(fontWeight: FontWeight.w600, color: colorBlack),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                "Software Engineer",
                style: appThemePrimary.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400, color: colorPrimary),
              ),
            ),
          ],
        ));
  }

  Widget _buttonView() {
    return Container(
        decoration: BoxDecoration(
          color: colorWhite,
        ),
        padding: EdgeInsets.only(left: 16, top: 80, right: 16, bottom: 0),
        child: Center(
            child: ButtonPillShaped(
          onPressed: (() {
            Navigator.of(context).pushNamed(qrCodeScannerViewRoute, arguments: {
              "title": "",
            });
          }),
          isDisabled: false,
          buttonTitle: "Scan QR Code",
        )));
  }

  Widget _userQRCodeView() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: Center(
              child: Image.asset(
                'assets/images/qr_code.png',
                height: 320,
                width: 250,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
