import 'package:flutter/material.dart';
import 'package:base/UI/MessagesBubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesStream extends StatelessWidget {
  MessagesStream({super.key});

  // Create an instance of firestore
  final _firestore = FirebaseFirestore.instance;

  // Get the messages from the firestore database using streams
  // void getMessagesStream() async {
  //   await for (var snapshot in _firestore.collection('messages').snapshots()) {
  //     for (var message in snapshot.docs) {
  //       print(message.data());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        // Check if the snapshot has data
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }

        // Get the data from the snapshot
        final messages = snapshot.data!.docs.reversed;

        // Create a list of Text widgets
        List<MessagesBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message['text'];
          final messageSender = message['sender'];

          final messageBubble = MessagesBubble(
              messageText: messageText, messageSender: messageSender);

          messageBubbles.add(messageBubble);
        }

        // Return a Column widget with the list of Text widgets
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
