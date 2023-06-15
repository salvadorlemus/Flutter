import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(Xylophone());
}

class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  Future<void> PlaySound(int soundID) async {
    final player = AudioPlayer();
    await player.setSource(AssetSource('note$soundID.wav'));
    await player.resume();
  }

  Expanded BuildKey(int soundID, Color color) {
    return Expanded(
      child: TextButton(
        onPressed: ()
          async {
            PlaySound(soundID);
          },
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BuildKey(1, Colors.red),
                BuildKey(2, Colors.orange),
                BuildKey(3, Colors.yellow),
                BuildKey(4, Colors.green),
                BuildKey(5, Colors.teal),
                BuildKey(6, Colors.blue),
                BuildKey(7, Colors.purple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
