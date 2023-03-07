import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Gmail_page extends StatefulWidget {
  const Gmail_page({Key? key}) : super(key: key);

  @override
  State<Gmail_page> createState() => _Gmail_pageState();
}

class _Gmail_pageState extends State<Gmail_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Container(width: 500, child: Lottie.asset("asset_image/image2.json")),
        Text(
          "WELCOME ",
          style: TextStyle(color: Colors.blue, fontSize: 25),
        )
      ]),
    );
  }
}
