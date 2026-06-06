import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:home_display/dashboard/domain/entity/card_data.dart';
import 'package:home_display/hls/presentation/components/hls_view.dart';
import 'package:home_display/rss_feed/presentation/components/rss_panel.dart';

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
    final double height =
        widget.card.height.toDouble() * widget.scaleH - 2 * widget.padding;
    final double width =
        widget.card.width.toDouble() * widget.scaleW - 2 * widget.padding;

    return Positioned(
      left: widget.card.xPos.toDouble() * widget.scaleW + widget.padding,
      top: widget.card.yPos.toDouble() * widget.scaleH + widget.padding,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withAlpha(128),
            ),
            width:
                widget.card.width.toDouble() * widget.scaleW -
                2 * widget.padding,
            height:
                widget.card.height.toDouble() * widget.scaleH -
                2 * widget.padding,
            // child: const Center(
            //   child: RssPanel(
            //     feedUrl: 'https://www.thehindu.com/feeder/default.rss',
            //   ),
            // ),
            child: HlsView(height: height, width: width),
          ),
        ),
      ),
    );
  }
}
