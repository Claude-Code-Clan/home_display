import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_display/rss_feed/data/repository/rss_feed_repository.dart';
import 'package:home_display/rss_feed/domain/bloc/rss_feed_bloc.dart';
import 'package:home_display/rss_feed/presentation/components/rss_error_state.dart';
import 'package:rss_feed/rss_feed.dart';

class RssPanel extends StatefulWidget {
  const RssPanel({
    required this.feedUrl,
    this.initialItems = const [],
    super.key,
  });

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
          RssFeedBloc(RssFeedRepository())
            ..add(LoadRssFeed('https://rg.ru/xml/index.xml')),
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
                return _RssItemCard(items: items);

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
  });

  final List<RssItem> items;

  @override
  State<_RssItemCard> createState() => _RssItemCardState();
}

class _RssItemCardState extends State<_RssItemCard> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CarouselSlider(
      options: CarouselOptions(
        height: 1000,
        autoPlay: true,
        viewportFraction: 1,
        autoPlayInterval: const Duration(seconds: 5),
      ),
      items: widget.items.map((i) {
        final imageUrl = FeedParser.getImageUrl(i);
        return Container(
          margin: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.cardColor.withAlpha(220),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (imageUrl != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return const SizedBox(
                        width: 72,
                        height: 72,
                        child: Icon(Icons.rss_feed),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      i.title?.trim().isNotEmpty == true
                          ? i.title!
                          : 'No Title',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      i.pubDate?.trim().isNotEmpty == true
                          ? i.pubDate!
                          : 'No Date',
                      style: theme.textTheme.bodySmall,
                    ),
                    if (i.description?.trim().isNotEmpty == true) ...[
                      const SizedBox(height: 8),
                      Text(
                        i.description ?? 'No Description',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
