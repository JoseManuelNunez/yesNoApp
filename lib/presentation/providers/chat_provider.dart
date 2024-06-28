import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNo = GetYesNo();

  List<Message> messageList = [
    Message(text: 'hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya llegaste a casa?', fromWho: FromWho.me),
  ];

  Future<void> sebdMessage(String text) async {
    // if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if ( text.endsWith('?') ) {
        await herReply();
    }

    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 150));
    moveScroll();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNo.getAnswer();

    messageList.add(herMessage);
    notifyListeners();
    moveScroll();
  }

  void moveScroll() {
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
