import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:home_display/dashboard/domain/entity/widget_positions.dart';
import 'package:home_display/dashboard/domain/entity/widgets_data.dart';
import 'package:home_display/hls/presentation/components/hls_view.dart';
import 'package:home_display/information/presentation/components/information.dart';
import 'package:home_display/parking/presentation/components/parking_widget.dart';
import 'package:home_display/rss_feed/presentation/components/rss_panel.dart';
import 'package:home_display/storage/presentation/components/storage_widget.dart';
import 'package:home_display/weather/presentation/components/weather_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    required this.scaleW,
    required this.card,
    required this.scaleH,
    required this.padding,
    required this.data,
    super.key,
  });

  final WidgetPosition card;
  final double scaleH;
  final double scaleW;
  final double padding;
  final WidgetsData? data;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  Widget defineCardContent(double width, double height) {
    switch (widget.data) {
      case final RssFeedData data:
        return RssPanel(feedUrl: data.feedUrl, height: height, width: width);
      case final HlsVideoData data:
        return HlsView(videoUrl: data.videoUrl, width: width, height: height);
      case final InformationData data:
        return Information(markdownData: data.markdownData);
      case final ParkingSpotData data:
        return ParkingWidget(data: data);
      case final StorageData data:
        return StorageWidget(data: data);
      case final WeatherData data:
        return WeatherWidget(data: data);
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final height =
        widget.card.height.toDouble() * widget.scaleH - 2 * widget.padding;
    final width =
        widget.card.width.toDouble() * widget.scaleW - 2 * widget.padding;

    return Positioned(
      left: widget.card.xPos.toDouble() * widget.scaleW + widget.padding,
      top: widget.card.yPos.toDouble() * widget.scaleH + widget.padding,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Skeletonizer(
            enabled: widget.data == null,
            ignoreContainers: true,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor.withAlpha(128),
              ),
              width: width,
              height: height,
              child: defineCardContent(width, height),
            ),
          ),
        ),
      ),
    );
  }
}
