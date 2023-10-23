import 'package:flutter/material.dart';
import 'package:stardust_crusaders_final_project/intExp.dart';
import 'package:stardust_crusaders_final_project/job/relocation_cost.dart';
import 'package:stardust_crusaders_final_project/journal.dart';
import 'settings.dart';
import 'job/salary_comparison.dart';
import 'job/goals.dart';
import 'entryView.dart';
import 'jobPosComp.dart';

class JoPage extends StatefulWidget {
  const JoPage({super.key});

  @override
  State<JoPage> createState() => JoPageState();
} //MyHomePage

class JoPageState extends State<JoPage> {

  static const topColor = Color(0x11B589D6);
  static const bottomColor = Color(0x11552586);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: const Text('Journal Page'),
        actions: [
        ],
      ),
      body:
      Center(
        child:

        Container(
          decoration: const BoxDecoration(
            /*gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [topColor, bottomColor]
            ),*/
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child:

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                          width: 150,
                          height: 150,
                          child:
                          ElevatedButton(
                            style:
                            ElevatedButton.styleFrom(
                              primary: Colors.green.shade800,
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const JournalPage(title: 'Job Search Experience')) );
                            },
                            child: const SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: Text(
                                  'Job Search Experience',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child:
                        ElevatedButton(
                          style:
                          ElevatedButton.styleFrom(
                            primary: Colors.green.shade800,
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const jobCompPage()) );
                          },
                          child: const SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: Text(
                                'Job Comparison',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child:
                      ElevatedButton(
                        style:
                        ElevatedButton.styleFrom(
                          primary: Colors.green.shade800,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const intExpPage()) );
                        },
                        child:
                        Container(
                          width: 100,
                          height: 100,
                          child: const Center(
                            child: Text(
                              'Interview Experience',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child:
                      ElevatedButton(
                        style:
                        ElevatedButton.styleFrom(
                          primary: Colors.green.shade800,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const entryViewPage()) );
                        },
                        child: const SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text(
                              'View Entries',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),


                ],
              ),

            ], // Children
          ),
        ),
      ),
    );
  }

}