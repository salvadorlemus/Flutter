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
                TextButton(
                  onPressed: ()
                    async {
                      PlaySound(1);
                    },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(''),
                ),
                TextButton(
                  onPressed: ()
                    async {
                      PlaySound(2);
                    },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: Text(''),
                ),
                TextButton(
                  onPressed: ()
                    async {
                      PlaySound(3);
                    },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.yellow,
                  ),
                  child: Text(''),
                ),
                TextButton(
                  onPressed: ()
                    async {
                      PlaySound(4);
                    },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(''),
                ),
                TextButton(
                  onPressed: ()
                    async {
                      PlaySound(5);
                    },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  child: Text(''),
                ),
                TextButton(
                  onPressed: ()
                    async {
                      PlaySound(6);
                    },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(''),
                ),
                TextButton(
                  onPressed: ()
                    async {
                      PlaySound(7);
                    },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  child: Text(''),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
