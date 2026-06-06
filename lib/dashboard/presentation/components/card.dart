import 'package:flutter/material.dart';
import 'package:home_display/dashboard/domain/entity/card_data.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({required this.card, super.key});

  final CardData card;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.card.xPos.toDouble(),
      top: widget.card.yPos.toDouble(),
      child: Container(
        width: widget.card.width.toDouble(),
        height: widget.card.height.toDouble(),
        color: Colors.blue,
        child: const Center(
          child: Text('Card'),
        ),
      ),
    );
  }
}
