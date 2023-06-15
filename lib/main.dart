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

  Expanded BuildKey({int soundID = 1, Color color = Colors.red}) {
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
                BuildKey(soundID : 1, color : Colors.red),
                BuildKey(soundID : 2, color : Colors.orange),
                BuildKey(soundID : 3, color : Colors.yellow),
                BuildKey(soundID : 4, color : Colors.green),
                BuildKey(soundID : 5, color : Colors.teal),
                BuildKey(soundID : 6, color : Colors.blue),
                BuildKey(soundID : 7, color : Colors.purple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
