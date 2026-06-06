import 'package:home_display/rss_feed/domain/repository/i_rss_feed_repository.dart';
import 'package:rss_feed/rss_feed.dart';

/// {@template RssFeedRepository}
///
/// {@endtemplate}
final class RssFeedRepository implements IRssFeedRepository {
  @override
  Future<List<RssItem>> getFeed(String url) async {
    final feed = await FeedParser.fetchFeed(url);
    return feed.items;
  }
}
