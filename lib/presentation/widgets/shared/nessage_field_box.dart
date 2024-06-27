import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(20));

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: InputDecoration(
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          filled: true,
          suffixIcon: IconButton(
              onPressed: () {
                final textValue = textController.value.text;

                textController.clear();
              }, icon: const Icon(Icons.send_outlined))),
              onFieldSubmitted: (value) => {
                textController.clear(),
                focusNode.requestFocus()
              },
    );
  }
}
