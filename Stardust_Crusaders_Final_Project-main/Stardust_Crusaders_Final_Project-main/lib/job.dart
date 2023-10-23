import 'dart:collection';
import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'settings.dart';
import 'job/income_expenses.dart';
import 'job/goals.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key});

  @override
  State<JobPage> createState() => JobPageState();
} //MyHomePage

List<bool> isCompleted =
    List.generate(100, (index) => index < 100 ? false : false)
      ..fillRange(0, 100, false);

class JobPageState extends State<JobPage> {
  List<String> goalTypes = [];
  List<String> actualGoal = [];

  bool theme(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    if (brightness == Brightness.dark) {
      return false;
    } else {
      return true;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: const Text('Job Tools'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_applications_sharp),
            tooltip: 'Settings',
            onPressed: () {
              theme(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SettingPage()));
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "GOALS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              )),
          SizedBox(
              height: 470,
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                // inside the <> you enter the type of your stream
                stream:
                    FirebaseFirestore.instance.collection("Goals").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Container(
                              color: theme(context) ? Colors.black12 : Colors.white10,
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 8.0,
                                  bottom: 8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    snapshot.data!.docs[index].get('Goal Type'),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Text(
                                          snapshot.data!.docs[index]
                                              .get('Goal'),
                                        )),
                                        IconButton(
                                            icon: isCompleted[index]
                                                ? Icon(Icons
                                                    .check_box,
                                              color: Colors.green.shade800,)
                                                : const Icon(
                                                    Icons.check_box_outline_blank,
                                                  ),
                                            onPressed: () => setState(() =>
                                                isCompleted[index] =
                                                    !isCompleted[index]))
                                      ])
                                ],
                              )),
                        );
                      },
                    );
                  }
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                      width: 150,
                      height: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade800,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const IncomeExpensesPage()));
                        },
                        child: const SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text(
                              'Income and Expenses',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            ),
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GoalsPage()));
                      },
                      child: const SizedBox(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: Text(
                            'Goals',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]

      ),
    );   // Children);
  }
}
