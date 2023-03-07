import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Firestoredata_adding extends StatefulWidget {
  const Firestoredata_adding({Key? key}) : super(key: key);

  @override
  State<Firestoredata_adding> createState() => _Firestoredata_addingState();
}

class _Firestoredata_addingState extends State<Firestoredata_adding> {
  add() async {
    await FirebaseFirestore.instance
        .collection("data")
        .add({"name": namecontrol.text});
  }
  List? nm=[];
  read() async {
    var alldata = await FirebaseFirestore.instance.collection("data").get();
    
    
    
     setState(() {
       nm = alldata.docs;
     });
    print(nm);
  }

  

  TextEditingController namecontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          TextField(
            controller: namecontrol,
            decoration: InputDecoration(hintText: "name"),
          ),
          ElevatedButton(
              onPressed: () {
                add();
                read();

              },
              child: Text("add")),
          Expanded(
            child: ListView.builder(
              itemCount: nm!.length,
              itemBuilder: (context,index) {
                return Text(nm![index].data()["name"]);
              }
            ),
          ),

        ]),
      ),
    );
  }
}
