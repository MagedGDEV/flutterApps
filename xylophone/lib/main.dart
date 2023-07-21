import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Xylophone(),
      ),
    ),
  );
}

class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () async {
          final player = AudioPlayer();
          await player.play(AssetSource('note1.wav'));
        },
        child: const Text('Click me'),
      ),
    );
  }
}
