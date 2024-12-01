import 'package:cbt_exam_browser/utils.dart';
import 'package:cbt_exam_browser/webview.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({super.key});

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  final _mobileScannerController = MobileScannerController(
    autoStart: true,
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        controller: _mobileScannerController,
        onDetect: (capture) {
          if (capture.barcodes[0].rawValue == null) {
            Navigator.pop(context);
            showToast("Failed to scan QR code!");
          }

          if (capture.barcodes[0].rawValue != null &&
              capture.barcodes[0].rawValue!.isEmpty) {
            Navigator.pop(context);
            showToast("QR code is invalid!");
          }
          Navigator.pop(context);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) =>
                  WebView(url: capture.barcodes[0].rawValue!)));
        },
      ),
    );
  }
}
