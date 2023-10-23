import 'package:flutter/material.dart';
import 'package:stardust_crusaders_final_project/changeThemeButton.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter/cupertino.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => SettingPageState();
} //MyHomePage

class SettingPageState extends State<SettingPage> {

  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.green.shade800,
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Center(
          child: Column(children: <Widget>[
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(11)),
                  child: Center(
                    child: TextField(
                      controller: hourController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(11)),
                  child: Center(
                    child: TextField(
                      controller: minuteController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text(
                  'Create alarm',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  int hour;
                  int minutes;
                  hour = int.parse(hourController.text);
                  minutes = int.parse(minuteController.text);

                  // creating alarm after converting hour
                  // and minute into integer
                  FlutterAlarmClock.createAlarm(hour, minutes);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {

                // show alarm
                FlutterAlarmClock.showAlarms();
              },
              child: const Text(
                'Show Alarms',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                  child: const Text(
                    'Create timer',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    int minutes;
                    minutes = int.parse(minuteController.text);

                    // create timer
                    FlutterAlarmClock.createTimer(minutes);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AboutDialog(
                            children: [
                              Center(
                                child: Text("Timer is set",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold)),
                              )
                            ],
                          );
                        });
                  }),
            ),
            ElevatedButton(
              onPressed: () {

                // show timers
                FlutterAlarmClock.showTimers();
              },
              child: Text(
                "Show Timers",
                style: TextStyle(fontSize: 17),
              ),
            )
          ])),
    );
  }
}

// Code Adapted by GeeksForGeeks.com
//https://www.geeksforgeeks.org/flutter-building-an-alarm-clock-app/#