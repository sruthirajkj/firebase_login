import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/Gmail_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class Firebase_animation extends StatefulWidget {
  const Firebase_animation({Key? key}) : super(key: key);

  @override
  State<Firebase_animation> createState() => _Firebase_animationState();
}

class _Firebase_animationState extends State<Firebase_animation> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  sighup() async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
    } catch (s) {
      print(s);
      String error = s.toString();
      if (error.contains("Password should be at least 6 characters")) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("Password should be at least 6 characters"),
              );
            });
      }

      if (error.contains("Given String is empty or null")) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("Given String is empty or null"),
              );
            });
      }
      if (error.contains(
          "The email address is already in use by another account.")) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text(
                    "The email address is already in use by another account."),
              );
            });
      }
      if (error.contains("The email address is badly formatted.")) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("The email address is badly formatted."),
              );
            });
      }
    }
  }

  login() async {
    try {
      var data1 = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
    } catch (p) {
      print(p);
      String error = p.toString();
      if (error.contains("Password should be at least 6 characters")) {
        Fluttertoast.showToast(
            msg: "Password should be at least 6 characters",
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.white,
            backgroundColor: Colors.blue,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            fontSize: 20);
      }
    }

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Gmail_page()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
              width: 200,
              height: 200,
              child: Lottie.asset("asset_image/img.json")),
          TextField(
            controller: emailcontroller,
            decoration: InputDecoration(
                hintText: "Email",
                suffixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
          TextField(
            controller: passwordcontroller,
            decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: Icon(Icons.remove_red_eye),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                login();
              },
              child: Text("LOGIN"),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                sighup();
              },
              child: Text("SIGNUP")),
        ]),
      ),
    );
  }
}
