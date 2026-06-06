import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_display/rss_feed/rss_feed.dart';
import 'package:home_display/l10n/l10n.dart';
import 'package:rss_feed/rss_feed.dart';

class RssFeed extends StatefulWidget {
  const RssFeed({super.key});

  @override
  State<RssFeed> createState() => _RssFeedState(item: RssItem());
}

class _RssFeedState extends State<RssFeed> {
  _RssFeedState({required this.item});

  static const List<String> feedUrls = [
    'https://www.bbc.com/news/world/rss.xml',
    'https://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml',
    'https://feeds.bbci.co.uk/news/technology/rss.xml',
    'https://www.thehindu.com/feeder/default.rss',
  ];

  final RssItem item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RSS'),
      ),
      //   body: FeedListScreen(
      //     feedUrls: feedUrls,
      //     config: const RSSConfig(
      //       defaultImageUrl: 'https://via.placeholder.com/150',
      //       feedNames: {
      //         'https://www.bbc.com/news/world/rss.xml': 'BBC Global',
      //         'https://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml':
      //             'NYT Home',
      //         'https://feeds.bbci.co.uk/news/technology/rss.xml': 'BBC Tech',
      //         'https://www.thehindu.com/feeder/default.rss': 'The Hindu News',
      //       },
      //     ),
      //   ),
      // );
      body: CustomNewsCard(
        title: item.title ?? 'Untitled',
        description: item.description ?? 'No description',
        date: item.pubDate ?? 'Unknown date',
        imageUrl: FeedParser.getImageUrl(
          item,
          fallbackImageUrl: 'https://via.placeholder.com/150',
        ),
        onTap: () {
          if (item.link != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetailScreen(
                  title: item.title ?? 'Untitled',
                  content: item.description ?? 'No content',
                  url: item.link!,
                  imageUrl: FeedParser.getImageUrl(item),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
