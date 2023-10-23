import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => GoalsPageState();
}

const List<String> goalType = <String>[
  'Career Goal',
  'Short-Term Goal',
  'Long-Term Goal'
];
var count = 0;

class GoalsPageState extends State<GoalsPage> {
  final database = FirebaseFirestore.instance.collection('Goals');
  var formKey = GlobalKey<FormState>();
  var goalController = TextEditingController();
  String goal = goalType.first;
  String goalInfo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Goals'),
          backgroundColor: Colors.green.shade800,
        ),
        body: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                      child: Text(
                        "Record the goal you would like to track below: ",
                        style: TextStyle(fontSize: 20),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DropdownButton<String>(
                        value: goal,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        style: TextStyle(color: Colors.green.shade800),
                        underline: Container(
                          height: 2,
                          color: Colors.green.shade800,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            goal = value!;
                          });
                        },
                        items: goalType
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        height: 120,
                        child: TextFormField(
                            maxLines: null,
                            expands: true,
                            controller: goalController,
                            keyboardType: TextInputType.multiline,
                            cursorColor: Colors.green.shade800,
                            decoration: const InputDecoration(
                                filled: true, hintText: 'Enter your goal'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Goal cannot be empty";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              goalInfo = value!;
                            }),
                      )),
                  Container(
                      margin: const EdgeInsets.all(20.0),
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 50.0,
                        width: 250.0,
                        child: recordButton(),
                      )),
                ])));
  }

  ElevatedButton recordButton() {
    return ElevatedButton(
      onPressed: record,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green.shade800,
          textStyle: const TextStyle(color: Colors.white70)),
      child: const Text(
        'RECORD',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  void record() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      count++;
      database.doc(count.toString()).set({"Goal Type": goal, "Goal": goalInfo});
      goalController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data Successfully Stored')),
      );
    }
  }
}
