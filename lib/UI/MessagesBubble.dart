import 'package:flutter/material.dart';

class MessagesBubble extends StatelessWidget {
  final String messageText;
  final String messageSender;

  const MessagesBubble(
      {super.key, required this.messageText, required this.messageSender});

  @override
  Widget build(BuildContext context) {
    // The padding here gives the bubble some space from the edge of the screen
    // and between bubbles
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            messageSender,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.lightBlueAccent,
            child: Padding(
              // The padding here gives text some space from the edge of the bubble
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                messageText,
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
