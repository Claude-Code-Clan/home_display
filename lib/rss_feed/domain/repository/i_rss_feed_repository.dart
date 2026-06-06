import 'package:rss_feed/rss_feed.dart';

/// {@template IRssFeedRepository}
///
/// {@endtemplate}
abstract interface class IRssFeedRepository {
  Future<List<RssItem>> getFeed(String url);
}
