import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stardust_crusaders_final_project/questionCard.dart';
import 'Question.dart';


class entryViewPage extends StatefulWidget {
  const entryViewPage({super.key});

  @override
  State<entryViewPage> createState() => entryViewPageState();
} //MyHomePage

class entryViewPageState extends State<entryViewPage> {
  List<Object> entryList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Entries'),
        backgroundColor: Colors.green.shade800,
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: entryList.length,
            itemBuilder: (context, index) {
              return QuestionCard(entryList[index] as Question);
            },
        ),
      )
    );
  }

  Future getList() async {
    //final uid = AuthService().currentUser?.uid;
    final daBase = FirebaseFirestore.instance.collection('Journal').orderBy('Date', descending: true);
    var data = await daBase.get();
    setState(() {
      entryList = List.from(data.docs.map((doc) => Question.fromSnapshot(doc)));
    });
  }

}

