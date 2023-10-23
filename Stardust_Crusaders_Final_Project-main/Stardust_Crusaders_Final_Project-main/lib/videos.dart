import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class VideosPage extends StatefulWidget {
  const VideosPage({super.key});

  @override
  State<VideosPage> createState() => VideosPageState();
} //MyHomePage

class VideosPageState extends State<VideosPage> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Videos'),
            backgroundColor: Colors.green.shade800,
          ),
          body: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(32),
              child: ListView(
                  children: [
                    const Text(
                      "How to Prepare For Job Interviews:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        backgroundColor: Colors.white
                      ),
                    ),
                    const SizedBox(height: 8.0,),
                    ElevatedButton(
                        onPressed: () async {
                          const url = 'https://youtu.be/QOrEyPitdIA';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade800,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            textStyle: const TextStyle(
                              fontSize: 15,
                            )
                        ),
                        child: const Text("How To Stay Confident")
                    ),
                    const SizedBox(height: 8.0,),
                    ElevatedButton(
                      onPressed: () async {
                        const url = 'https://youtu.be/OqtM8Zt_Dcg';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        textStyle: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      child: const Text("How To Tell About Yourself"),
                    ),
                    const SizedBox(height: 8.0,),
                    ElevatedButton(
                      onPressed: () async {
                        const url = 'https://youtu.be/tgUxJIcmQlM';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        textStyle: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      child: const Text("What To Wear To Job Interviews"),
                    ),
                    const SizedBox(height: 8.0,),
                    ElevatedButton(
                      onPressed: () async {
                        const url = 'https://youtu.be/wn_EvOBcFJQ';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        textStyle: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      child: const Text("5 Things Before An Interview"),
                    ),
                    const SizedBox(height: 8.0,),
                    ElevatedButton(
                      onPressed: () async {
                        const url = 'https://youtu.be/MW806ap6uk0';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        textStyle: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      child: const Text("3 Tips For Shy People"),
                    ),
                    const Text(
                      "Q&A Practices:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                          backgroundColor: Colors.white
                      ),
                    ),
                    const SizedBox(height: 8.0,),
                    ElevatedButton(
                      onPressed: () async {
                        const url = 'https://youtu.be/T1vTofBM_uA';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        textStyle: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      child: const Text("Mock Interview"),
                    ),
                    const SizedBox(height: 8.0,),
                    ElevatedButton(
                      onPressed: () async {
                        const url = 'https://youtu.be/dHTgzj7owFc';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        textStyle: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      child: const Text("Top 30 Interview Questions"),
                    ),
                    const SizedBox(height: 8.0,),
                    ElevatedButton(
                      onPressed: () async {
                        const url = 'https://youtu.be/6bJTEZnTT5A';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        textStyle: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      child: const Text("Last-Minute Interview Prep"),
                    ),
                    const Text(
                      "Extra Information:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                          backgroundColor: Colors.white
                      ),
                    ),
                    const SizedBox(height: 8.0,),
                    ElevatedButton(
                      onPressed: () async {
                        const url = 'https://youtu.be/vzk5DCFJr8c';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        textStyle: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      child: const Text("Top 5 Programming Languages"),
                    ),
                    const SizedBox(height: 8.0,),
                    ElevatedButton(
                      onPressed: () async {
                        const url = 'https://youtu.be/cM4bCDbCVbw';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        textStyle: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      child: const Text("Top 10 Most Valuable Tech Companies"),
                    ),
                  ]
              )
          )
      );
    }
  }
