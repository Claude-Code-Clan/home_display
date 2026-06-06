import 'package:rss_feed/rss_feed.dart';

import '../../domain/repository/i_rss_feed_repository.dart';

/// {@template RssFeedMockRepository}
///
/// {@endtemplate}
final class RssFeedMockRepository implements IRssFeedRepository {
  @override
  Future<List<RssItem>> getFeed(String url) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        RssItem(
          title: 'Mock Item 1',
          description: 'This is a mock item for testing.',
          pubDate: DateTime.now().toString(),
          link: 'https://example.com/mock-item-1',
        ),
        RssItem(
          title: 'Mock Item 2',
          description: 'This is another mock item for testing.',
          pubDate: DateTime.now().toString(),
          link: 'https://example.com/mock-item-2',
        ),
      ],
    );
  }
}
