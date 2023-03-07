import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login/FirestoreData.dart';
import 'package:flutter/material.dart';

class CloudFireStoreExamle extends StatefulWidget {
  const CloudFireStoreExamle({Key? key}) : super(key: key);

  @override
  State<CloudFireStoreExamle> createState() => _CloudFireStoreExamleState();
}

class _CloudFireStoreExamleState extends State<CloudFireStoreExamle> {
  adding() async {
    await FirebaseFirestore.instance
        .collection("details")
        .add({"name": namecontroller.text, "age": agecontroller.text});
  }

  readfn() async {
    var fulldata = await FirebaseFirestore.instance.collection("details").get();
    var name = fulldata.docs[0].data()["name"];
    print(name);
  }

  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            FloatingActionButton(
              onPressed: () {
                adding();
                Navigator.of(context).push(MaterialPageRoute(builder: (contex) {
                  return Firebase_data();
                }));
              },
              child: Text("adding"),
            ),
            FloatingActionButton(
              onPressed: () {
                readfn();

              },
              child: Text("read"),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(hintText: "Name"),
            ),
            TextField(
              controller: agecontroller,
              decoration: InputDecoration(hintText: "age"),
            ),
          ]),
        ],
      ),
    );
  }
}
