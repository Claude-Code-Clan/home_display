import 'package:flutter/material.dart';
import 'package:home_display/dashboard/domain/entity/card_data.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    required this.scaleW,
    required this.card,
    required this.scaleH,
    required this.padding,
    super.key,
  });

  final CardData card;
  final double scaleH;
  final double scaleW;
  final double padding;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.card.xPos.toDouble() * widget.scaleW + widget.padding,
      top: widget.card.yPos.toDouble() * widget.scaleH + widget.padding,
      child: Container(
        width:
            widget.card.width.toDouble() * widget.scaleW - 2 * widget.padding,
        height:
            widget.card.height.toDouble() * widget.scaleH - 2 * widget.padding,
        color: Colors.blue,
        child: const Center(
          child: Text('Card'),
        ),
      ),
    );
  }
}
