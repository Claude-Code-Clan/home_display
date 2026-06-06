part of 'rss_feed_bloc.dart';

@immutable
sealed class RssFeedEvent {}

final class LoadRssFeed extends RssFeedEvent {
  LoadRssFeed(this.url);

  final String url;
}
