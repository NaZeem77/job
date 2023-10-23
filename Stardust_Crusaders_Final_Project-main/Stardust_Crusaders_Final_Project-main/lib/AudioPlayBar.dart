import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

class AudioPlayBar extends StatefulWidget {
  //const SoundPage({super.key});
  AudioPlayBar({
    Key? key,
    this.isPlaying = false,
    required this.onPlayStateChanged,
    required this.currentTime,
    required this.onSeekBarMoved,
    required this.totalTime,
  }) : super(key: key);

  bool isPlaying;
  final ValueChanged<bool> onPlayStateChanged;
  final Duration currentTime;
  final ValueChanged<Duration> onSeekBarMoved;
  final Duration totalTime;

  @override
  State<AudioPlayBar> createState() => _AudioPlayBarState();
} //MyHomePage

class _AudioPlayBarState extends State<AudioPlayBar> {
  double sliderValue = 0;
  bool userIsMovingSlider = false;

  @override
  void initState() {
    super.initState();
    sliderValue = getSliderValue();
    userIsMovingSlider = false;
  }

  @override
  Widget build(BuildContext context) {
    if (!userIsMovingSlider) {
      sliderValue = getSliderValue();
    }

    return Scaffold(
      body: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildIconButton(),
          Text(
            getTimeString(sliderValue),
            style: const TextStyle(
              fontFeatures: [FontFeature.tabularFigures()],
            ),
          ),
          Expanded(
            child: buildSlider(context),
          ),
          Text(
            getTimeString(1.0),
          ),
        ],
      ),
    );
// =======
//       return Container(
//         child: Row(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             buildIconButton(),
//             Text(
//               getTimeString(sliderValue),
//               style: TextStyle(
//                 fontFeatures: [FontFeature.tabularFigures()],
//               ),
//             ),
//             Expanded(
//               child: buildSlider(context),
//             ),
//             Text(
//               getTimeString(1.0),
//             ),
//           ],
//         ),
//       );
// >>>>>>> f2ee4e079ed0d0de0bc677da38ec37829cf86fdd
  }

  Slider buildSlider(BuildContext context) {
    return Slider(
        value: sliderValue,
        inactiveColor: Theme.of(context).disabledColor,
        onChangeStart: (value) {
          userIsMovingSlider = true;
        },
        onChanged: (value) {
          setState(() {
            sliderValue = value;
          });
        },
        onChangeEnd: (value) {
          userIsMovingSlider = false;
          if (widget.onSeekBarMoved != null) {
            final seconds = widget.totalTime.inSeconds * sliderValue;
            final currentTime = Duration(seconds: seconds.toInt());
            widget.onSeekBarMoved(currentTime);
          }
        });
  }

  double getSliderValue() {
    return widget.currentTime.inMilliseconds / widget.totalTime.inMilliseconds;
  }

  String getTimeString(double sliderValue) {
    final secondsAmount = widget.totalTime.inSeconds * sliderValue;
    final time = Duration(seconds: secondsAmount.toInt());
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    final minutes =
        twoDigits(time.inMinutes.remainder(Duration.minutesPerHour));
    final seconds =
        twoDigits(time.inSeconds.remainder(Duration.secondsPerMinute));
    final hours = widget.totalTime.inHours > 0 ? '${time.inHours}:' : '';
    return "$hours$minutes:$seconds";
  }

  IconButton buildIconButton() {
    return IconButton(
      icon: (widget.isPlaying) ? Icon(Icons.pause) : Icon(Icons.play_arrow),
      color: Color.fromARGB(255, 16, 16, 214),
      onPressed: () {
        if (widget.onPlayStateChanged != null) {
          widget.onPlayStateChanged(!widget.isPlaying);
          widget.isPlaying = !widget.isPlaying;
        }
      },
    );
  }
}

String daNewName = '';
