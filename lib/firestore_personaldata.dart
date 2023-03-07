import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Firestore_personaldata extends StatefulWidget {
  const Firestore_personaldata({Key? key}) : super(key: key);

  @override
  State<Firestore_personaldata> createState() => _Firestore_personaldataState();
}

class _Firestore_personaldataState extends State<Firestore_personaldata> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController photocontroller = TextEditingController();
  add() async {
      await FirebaseFirestore.instance.collection("person").add({
      "name": namecontroller.text,
      "email": emailcontroller.text,
      "url": photocontroller.text
    });
  }

  List ? info = [];
  read() async {
    var personaldata =
        await FirebaseFirestore.instance.collection("person").get();
    setState(() {
      info = personaldata.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          TextField(
            controller: namecontroller,
            decoration: InputDecoration(hintText: "name"),
          ),
          TextField(
            controller: emailcontroller,
            decoration: InputDecoration(hintText: "email"),
          ),
          TextField(
            controller: photocontroller,
            decoration: InputDecoration(hintText: "url"),
          ),
          ElevatedButton(
              onPressed: () {
                add();
                read();
              },
              child: Text("save")),
          Expanded(
            child: ListView.builder(
                itemCount: info!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(info![index].data()["name"].toString()),
                      subtitle: Text(info![index].data()["email"].toString()),
                      leading: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                            image: DecorationImage(
                                image: NetworkImage(
                                    info![index].data()["url"]))),
                      ),
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
