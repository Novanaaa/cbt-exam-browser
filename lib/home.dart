import 'package:flutter/material.dart';
import 'webview.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _textFieldController = TextEditingController();

  Future<void> inputUrl(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('INPUT URL'),
          content: TextField(
            controller: _textFieldController,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('ENTER'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        WebView(url: _textFieldController.text)));
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> scanQR() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(225, 0, 0, 0),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  "assets/background.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 180),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icon.png",
                        width: 135,
                        height: 135,
                      ),
                      const SizedBox(height: 5),
                      const Text("CBT Exam Browser",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20)),
                      const SizedBox(height: 5),
                      const Text("v 5.0"),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                inputUrl(context);
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 80, right: 80, top: 14, bottom: 14),
                                child: Text(
                                  "Input Url",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                      color: Color.fromARGB(225, 0, 0, 0)),
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: scanQR,
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 80, right: 80, top: 14, bottom: 14),
                                child: Text(
                                  "Scan QR",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                      color: Color.fromARGB(225, 0, 0, 0)),
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.sync_lock,
                                        size: 32,
                                      ))),
                              const SizedBox(height: 3),
                              const Text(
                                "Useragent",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              )
                            ],
                          ),
                          const SizedBox(width: 4),
                          Column(
                            children: [
                              Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.share,
                                        size: 32,
                                      ))),
                              const SizedBox(height: 3),
                              const Text(
                                "Share",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              )
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.star,
                                        size: 32,
                                      ))),
                              const SizedBox(height: 3),
                              const Text(
                                "Rate Us",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              )
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.bug_report,
                                        size: 32,
                                      ))),
                              const SizedBox(height: 3),
                              const Text(
                                "Report",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
