import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Firebase_data extends StatefulWidget {
  const Firebase_data({Key? key}) : super(key: key);

  @override
  State<Firebase_data> createState() => _Firebase_dataState();
}

class _Firebase_dataState extends State<Firebase_data> {



  @override
  String datas="";
  void initState() {
    // TODO: implement initState

    super.initState();
    readfu();
  }
  readfu()async{
    var fulldata= await FirebaseFirestore.instance.collection("details").get();
    var data= fulldata.docs[0].data()["name"];
    print(data);
    datas=data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold (body: Center(child: Text(datas )),
    );
  }
}

