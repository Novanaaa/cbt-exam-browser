import 'package:cbt_exam_browser/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:intl/intl.dart';

class WebView extends StatefulWidget {
  const WebView({super.key, required this.url});

  final String url;

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  InAppWebViewController? _webViewController;

  final settings = InAppWebViewSettings(
    javaScriptEnabled: true,
    isInspectable: kDebugMode,
    cacheEnabled: true,
    geolocationEnabled: true,
    supportZoom: true,
    isPagingEnabled: true,
    supportMultipleWindows: true,
    safeBrowsingEnabled: false,
    allowBackgroundAudioPlaying: false,
    iframeAllowFullscreen: true,
    upgradeKnownHostsToHTTPS: true,
    transparentBackground: true,
  );

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: appWebView(),
        bottomNavigationBar: Container(
          color: Colors.black,
          padding: const EdgeInsets.all(7),
          child: bottomNavigationList(),
        ));
  }

  Opacity bottomNavigationList() {
    return Opacity(
      opacity: 0.65,
      child: Row(
        children: [
          ElevatedButton(
              style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(
                      EdgeInsets.only(bottom: 6, top: 6)),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.red))),
                  backgroundColor: const WidgetStatePropertyAll(Colors.black)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const Home()));
              },
              child: const Text("Exit", style: TextStyle(color: Colors.red))),
          const SizedBox(width: 5),
          SizedBox(
            width: 45,
            child: ElevatedButton(
                style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(
                        EdgeInsets.only(bottom: 6, top: 6)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                    backgroundColor:
                        const WidgetStatePropertyAll(Colors.white)),
                onPressed: () {
                  _webViewController?.goTo(
                      historyItem: WebHistoryItem(url: WebUri(widget.url)));
                },
                child: const Icon(
                  Icons.home,
                  color: Colors.black,
                )),
          ),
          const SizedBox(width: 5),
          SizedBox(
            width: 45,
            child: ElevatedButton(
                style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(
                        EdgeInsets.only(bottom: 6, top: 6)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                    backgroundColor:
                        const WidgetStatePropertyAll(Colors.white)),
                onPressed: () {
                  _webViewController?.goBack();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
          ),
          const SizedBox(width: 5),
          SizedBox(
            width: 45,
            child: ElevatedButton(
                style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(
                        EdgeInsets.only(bottom: 6, top: 6)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                    backgroundColor:
                        const WidgetStatePropertyAll(Colors.white)),
                onPressed: () {
                  _webViewController?.reload();
                },
                child: const Icon(
                  Icons.refresh,
                  color: Colors.black,
                )),
          ),
          const SizedBox(width: 5),
          SizedBox(
            width: 45,
            child: ElevatedButton(
                style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(
                        EdgeInsets.only(bottom: 6, top: 6)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                    backgroundColor:
                        const WidgetStatePropertyAll(Colors.white)),
                onPressed: () {
                  _webViewController?.goForward();
                },
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                )),
          ),
          const SizedBox(width: 5),
          Container(
            width: 75,
            height: 42,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.wifi,
                      size: 13,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 2),
                    Text(DateFormat('Hm').format(DateTime.now()),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))
                  ],
                ),
                const SizedBox(height: 2),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0.5)),
                    width: 75,
                    height: 0),
                const SizedBox(height: 2),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.battery_full,
                      size: 13,
                      color: Colors.white,
                    ),
                    SizedBox(width: 2),
                    Text("41%",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  InAppWebView appWebView() {
    return InAppWebView(
      initialSettings: settings,
      onWebViewCreated: (controller) {
        _webViewController = controller;
      },
      initialUrlRequest: URLRequest(
          url: WebUri(widget.url.isEmpty ? "https://google.com" : widget.url)),
    );
  }
}
