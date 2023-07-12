import 'package:flutter/material.dart';
import 'package:base/UI/MessagesBubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessagesStream extends StatelessWidget {
  MessagesStream(
      {super.key, required User user, required FirebaseFirestore firestore});

  // Reference to my local user
  User user = FirebaseAuth.instance.currentUser!;
  final firestore = FirebaseFirestore.instance;

  // Get the messages from the firestore database using streams
  // void getMessagesStream() async {
  //   await for (var snapshot in firestore.collection('messages').snapshots()) {
  //     for (var message in snapshot.docs) {
  //       print(message.data());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').snapshots(),
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

          // Get the current user
          final currentUser = user.email;

          if (messageSender == currentUser) {
            // The message is from the logged in user
          }

          final messageBubble = MessagesBubble(
              messageText: messageText,
              messageSender: messageSender,
              isMe: currentUser == messageSender);

          messageBubbles.add(messageBubble);
        }

        // Return a Column widget with the list of Text widgets
        return Expanded(
          child: ListView(
            reverse: true,
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
