import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    const MaterialApp(
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
          audioButton(color: Colors.blue.shade200, soundNumber: 1),
          audioButton(color: Colors.blue.shade300, soundNumber: 2),
          audioButton(color: Colors.blue.shade400, soundNumber: 3),
          audioButton(color: Colors.blue.shade500, soundNumber: 4),
          audioButton(color: Colors.blue.shade600, soundNumber: 5),
          audioButton(color: Colors.blue.shade700, soundNumber: 6),
          audioButton(color: Colors.blue.shade800, soundNumber: 7),
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
