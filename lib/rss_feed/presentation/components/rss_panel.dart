import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_display/rss_feed/data/repository/rss_feed_repository.dart';
import 'package:home_display/rss_feed/domain/bloc/rss_feed_bloc.dart';
import 'package:home_display/rss_feed/presentation/components/rss_base.dart';
import 'package:home_display/rss_feed/presentation/components/rss_error_state.dart';
import 'package:home_display/rss_feed/presentation/components/rss_mini.dart';
import 'package:rss_feed/rss_feed.dart';

class RssPanel extends StatefulWidget {
  const RssPanel({
    required this.height,
    required this.width,
    required this.feedUrl,
    this.initialItems = const [],
    super.key,
  });

  final double height;
  final double width;
  final String feedUrl;
  final List<RssItem> initialItems;

  @override
  State<RssPanel> createState() => _RssPanelState();
}

class _RssPanelState extends State<RssPanel> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RssFeedBloc(RssFeedRepository())..add(LoadRssFeed(widget.feedUrl)),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: BlocBuilder<RssFeedBloc, RssFeedState>(
          builder: (context, state) {
            switch (state) {
              case RssFeedInitial _:
                return const Center(child: CircularProgressIndicator());
              case RssFeedLoading _:
                return const Center(child: CircularProgressIndicator());
              case final RssFeedLoaded state:
                final items = state.items;
                if (items.isEmpty) {
                  return const Center(
                    child: Text('No RSS items found'),
                  );
                }
                return _RssItemCard(
                  items: items,
                  height: widget.height,
                  width: widget.width,
                );

              case final RssFeedError state:
                final error = state.error;
                return RssErrorState(error: error);
            }
          },
        ),
      ),
    );
  }
}

class _RssItemCard extends StatefulWidget {
  const _RssItemCard({
    required this.items,
    required this.height,
    required this.width,
  });

  final List<RssItem> items;
  final double height;
  final double width;

  @override
  State<_RssItemCard> createState() => _RssItemCardState();
}

class _RssItemCardState extends State<_RssItemCard> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: widget.height,
        autoPlay: true,
        viewportFraction: 1,
        autoPlayInterval: const Duration(seconds: 5),
      ),
      items: widget.items.map((i) {
        FeedParser.getImageUrl(i);
        if (widget.height < 200 || widget.width < 200) {
          return RssMini(item: i, width: widget.width, height: widget.height);
        } else {
          return RssBase(
            height: widget.height,
            width: widget.width,
            item: i,
          );
        }
      }).toList(),
    );
  }
}
