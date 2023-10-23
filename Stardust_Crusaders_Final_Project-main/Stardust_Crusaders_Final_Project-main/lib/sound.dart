import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'AudioPlayBar.dart';

class SoundPage extends StatefulWidget {
  const SoundPage({Key? key}) : super(key: key);

  @override
  State<SoundPage> createState() => SoundPageState();
} //MyHomePage

class SoundPageState extends State<SoundPage> {
  AudioPlayer player = AudioPlayer();
  String audioasset = "assets/songs/Ballin' ft. Tokai Teio (Uma Musume).mp3";
  int currentpos = 0;
  int maxDuration = 15;
  late Uint8List audioBytes;

  // times 2
  AudioPlayer player1 = AudioPlayer();
  String audioasset1 = "assets/songs/Could_Have_Been_Me.mp3";
  int currentpos1 = 0;
  int maxDuration1 = 07;
  late Uint8List audioBytes1;

  AudioPlayer player2 = AudioPlayer();
  String audioasset2 = "assets/songs/Girl_on_Fire.mp3";
  int currentpos2 = 0;
  int maxDuration2 = 03;
  late Uint8List audioBytes2;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      ByteData bytes =
      await rootBundle.load(audioasset);
      ByteData bytes1 =
      await rootBundle.load(audioasset1);
      ByteData bytes2 =
      await rootBundle.load(audioasset2);
      audioBytes =
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      audioBytes1 =
          bytes1.buffer.asUint8List(bytes1.offsetInBytes, bytes1.lengthInBytes);
      audioBytes2 =
          bytes2.buffer.asUint8List(bytes2.offsetInBytes, bytes2.lengthInBytes);
      player.onDurationChanged.listen((Duration d) {
        maxDuration = d.inSeconds;
        setState(() {});
      });
      player1.onDurationChanged.listen((Duration d) {
        maxDuration1 = d.inSeconds;
        setState(() {});
      });
      player2.onDurationChanged.listen((Duration d) {
        maxDuration2 = d.inSeconds;
        setState(() {});
      });
      player.onAudioPositionChanged.listen((Duration p) {
        currentpos = p.inSeconds;
        setState(() {
        });
      });
      player1.onAudioPositionChanged.listen((Duration p) {
        currentpos1 = p.inSeconds;
        setState(() {
        });
      });
      player2.onAudioPositionChanged.listen((Duration p) {
        currentpos2 = p.inSeconds;
        setState(() {
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sound'),
        backgroundColor: Colors.green.shade800,
      ),

      body: Center(
        child: Column(
        children: [
        AudioPlayBar(
          onPlayStateChanged: (value) {
            //setState(() async {
              if (value) {
                //int result = await player.playBytes(audioBytes);
                player.playBytes(audioBytes);
              } else {
                //int result = await player.stop();
                player.stop();
              }
          },
          currentTime: Duration(minutes: 0, seconds: currentpos),
          onSeekBarMoved: (value) {},
          totalTime: Duration(minutes: 0, seconds: maxDuration),
        ),
          Text(
            'Song: Tokai Teio Ballin but full version',
          ),
          AudioPlayBar(
            onPlayStateChanged: (value) {
              //setState(() async {
                if (value) {
                  //int result = await player.playBytes(audioBytes1);
                  player1.playBytes(audioBytes1);
                } else {
                  player1.stop();
                  //int result = await player.stop();
                }
            },
            currentTime: Duration(minutes: 0, seconds: currentpos1),
            onSeekBarMoved: (value) {},
            totalTime: Duration(minutes: 0, seconds: maxDuration1),
          ),
          Text(
            'Song: Could Have Been Me by The Struts',
          ),
          AudioPlayBar(
            onPlayStateChanged: (value) {
              //setState(() async {
              if (value) {
                //int result = await player.playBytes(audioBytes1);
                player2.playBytes(audioBytes2);
              } else {
                player2.stop();
                //int result = await player.stop();
              }
            },
            currentTime: Duration(minutes: 0, seconds: currentpos2),
            onSeekBarMoved: (value) {},
            totalTime: Duration(minutes: 3, seconds: maxDuration2),
          ),
          Text(
            'Song: Girl on Fire by Alicia Keys',
          ),
        ],
      ),
      )

    );
  }

  String daNewName = '';

}

