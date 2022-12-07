import 'package:flutter/material.dart';
import 'package:qr_code_scanner_app/config/routing_constants.dart';
import 'package:qr_code_scanner_app/ui/shared/splash_screen.dart';
import 'package:qr_code_scanner_app/ui/screens/qr_code_scanner/qr_scanner_dashboard.dart';
import '../ui/screens/qr_code_scanner/qr_scanner_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case landing:
      return MaterialPageRoute(builder: (_) => const SplashScreen());

    case qrCodeScannerDashboardRoute:
      return MaterialPageRoute(builder: (_) => const QRCodeScannerDashboard());

    case qrCodeScannerViewRoute:
      return MaterialPageRoute(builder: (_) => const QRCodeScannerView());

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ));
  }
}
