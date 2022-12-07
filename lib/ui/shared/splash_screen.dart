import 'package:flutter/material.dart';
import '../../config/app_theme.dart';
import 'package:qr_code_scanner_app/config/routing_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      nagiatorDecider();
    });
  }

  void nagiatorDecider() {
    Navigator.pushNamedAndRemoveUntil(context, '/qrCodeScannerDashboardRoute',
        ModalRoute.withName(qrCodeScannerDashboardRoute));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colorSecondary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.qr_code,
                  size: 80, color: Color.fromARGB(255, 90, 43, 167)),
              Container(
                padding: const EdgeInsets.only(bottom: 15, top: 16),
                child: Text("QR Code Scanner",
                    style: appThemePrimary.textTheme.headline3?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 90, 43, 167))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
