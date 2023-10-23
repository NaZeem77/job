import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'videos.dart';
import 'job.dart';
import 'journal.dart';
import 'settings.dart';
import 'sound.dart';
import 'package:firebase_core/firebase_core.dart';
import 'themeProvider.dart';
import 'package:provider/provider.dart';
import 'zaJournalPage.dart';
import 'videos.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  => ChangeNotifierProvider(
  create: (context) => ThemeProvider(),
  builder: (context, _) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Stardust Crusaders Job App',
      themeMode: themeProvider.themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,

      home: const MyHomePage(title: 'Stardust Crusaders'),
    );
  },
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {
    });
  }

    int _tappedIndex = 0;
    final pages = [
      JobPage(),
      SoundPage(),
      JoPage(),
      VideosPage(),
    ];

    void _onItemSelected (int index) {
      setState(() {
        _tappedIndex = index;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          extendBody: true,
          body: pages[_tappedIndex],

          bottomNavigationBar:

          Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.transparent,
                textTheme: Theme
                    .of(context)
                    .textTheme
                    .copyWith(bodySmall: const TextStyle(color: Colors.red))), // sets the inactive color of the `BottomNavigationBar`
            child: BottomNavigationBar(
              elevation: 0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Job',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.library_music_outlined),
                  label: 'Sound',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.border_color_outlined),
                  label: 'Journal',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.laptop_windows_outlined),
                  label: 'Videos',
                ),

              ],
              currentIndex: _tappedIndex,
              selectedItemColor: Colors.green.shade800,
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              onTap: _onItemSelected,
            ),



          )
      );
  }
}
