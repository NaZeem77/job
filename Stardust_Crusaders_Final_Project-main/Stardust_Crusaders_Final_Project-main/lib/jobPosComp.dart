import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';


class jobCompPage extends StatefulWidget {
  const jobCompPage({super.key});

  @override
  State<jobCompPage> createState() => jobCompPageState();
} //MyHomePage

class jobCompPageState extends State<jobCompPage> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Compare Job Positions'),
        backgroundColor: Colors.green.shade800,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                  height: 120,
                  child: TextFormField(
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    cursorColor: Colors.green.shade800,
                    decoration: const InputDecoration(
                        filled: true, hintText: 'What job positions are you thinking about?'),
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return "Entry Cannot Be Empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      daEntry = value;
                    },
                  )
              ),
            ),
            Container(
                margin: const EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: SizedBox(
                  height: 50.0,
                  width: 250.0,
                  child: recordButton(),
                )
            )
          ],
        ),
      ),
    );
  }

}

String daEntry = '';

ElevatedButton recordButton() {
  return ElevatedButton(
    onPressed: record,
    style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green.shade800,
        textStyle: const TextStyle(color: Colors.white70)),
    child: const Text(
      'SAVE',
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
  );
}

void record() {
  daBase.doc().set({"Type": 'Job Comparison', "Date": Timestamp.now(), "Entry": daEntry});

}


final daBase = FirebaseFirestore.instance.collection('Journal');