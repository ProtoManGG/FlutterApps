import 'package:chatroom/src/widgets/chat_message_other.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageWall extends StatelessWidget {
  final List<QueryDocumentSnapshot> messages;

  const MessageWall({Key? key, required this.messages}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (BuildContext context, int index) {
        // return ListTile(
        //   title: Text(messages[index].data()['value'].toString()),
        // );

        return ChatMessageOther(index: index, data: messages[index].data());
      },
    );
  }
}
