import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Xylophone(),
      ),
    ),
  );
}

class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          audioButton(color: Colors.red, soundNumber: 1),
          audioButton(color: Colors.orange, soundNumber: 2),
          audioButton(color: Colors.yellow, soundNumber: 3),
          audioButton(color: Colors.teal, soundNumber: 4),
          audioButton(color: Colors.green, soundNumber: 5),
          audioButton(color: Colors.blue, soundNumber: 6),
          audioButton(color: Colors.deepPurple, soundNumber: 7),
        ],
      ),
    );
  }

  void playSound(int soundNumber) {
    final audioPlayer = AudioPlayer(playerId: soundNumber.toString());
    audioPlayer.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded audioButton({required Color color, required int soundNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () {
          playSound(soundNumber);
        },
        child: Container(
          padding: EdgeInsets.zero,
          color: color,
        ),
      ),
    );
  }
}
