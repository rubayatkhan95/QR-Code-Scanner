// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner_app/config/app_theme.dart';
import 'package:qr_code_scanner_app/ui/widgets/avatar.dart';
import 'package:qr_code_scanner_app/ui/widgets/card.dart';

class QRCodeScannerView extends StatefulWidget {
  const QRCodeScannerView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRCodeScannerViewState();
}

class _QRCodeScannerViewState extends State<QRCodeScannerView> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
          const Duration(seconds: 1), () => flipCameraFunction(controller));
    });
  }

  void flipCameraFunction(controller) async {
    await controller!.flipCamera();
    await controller!.flipCamera();
    setState(() {});
  }

  Future<void> verifyQRCode(String value) async {}

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    if (result != null) {
      verifyQRCode(result!.code.toString());
    } else {}

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Code'),
      ),
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          if (result != null)
            Container(
              padding: const EdgeInsets.only(left: 28, right: 28, bottom: 20),
              color: Colors.transparent,
              child: CardListTile(
                rectangleCard: true,
                customSubtitleStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: colorPrimary),
                customTitleStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: colorPrimary),
                tileColor: colorPrimary,
                leading: Avatar(
                  height: 50.0,
                  width: 50.0,
                  icon: Icon(
                    Icons.qr_code,
                    color: colorSecondary,
                  ),
                  color: colorPrimary,
                ),
                title: 'Barcode Type: ${describeEnum(result!.format)}',
                subtitle: "Data: ${result!.code}",
                onTapListTile: () {},
                onTapRightIcon: () {},
              ),
            )
          else
            Text(
              'Scan a code',
              textAlign: TextAlign.center,
              style: TextStyle(color: colorPrimary, fontSize: 20),
            ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 280.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
