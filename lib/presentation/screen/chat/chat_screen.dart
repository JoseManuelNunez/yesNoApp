import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/nessage_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxLZ8YRBzoCnoxsM2zVBlUk3Vj22AZvFBvbw&s'),
          ),
        ),
        title: const Text('Mi Amor'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvier = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvier.chatScrollController,
              itemCount: chatProvier.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvier.messageList[index];

                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(text: message.text, imageUrl: message.imageUrl!,)
                    : MyMessageBubble(text: message.text,);
              },
            )),
            MessageFieldBox(
              onValue: chatProvier.sebdMessage,
            )
          ],
        ),
      ),
    );
  }
}
