import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final String text;
  final String imageUrl;
  const HerMessageBubble({super.key, required this.text, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              )),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(imageUrl: imageUrl,),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
        child: Image.network(
            imageUrl,
            width: size.width * 0.7,
            height: 150,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return Container(
                width: size.width * 0.7,
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Text('cargando imagen'),
              );
            },
            ));
  }
}
