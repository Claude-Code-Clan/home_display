part of 'rss_feed_bloc.dart';

@immutable
sealed class RssFeedState {}

final class RssFeedInitial extends RssFeedState {}

final class RssFeedLoading extends RssFeedState {}

final class RssFeedLoaded extends RssFeedState {
  final List<RssItem> items;

  RssFeedLoaded(this.items);
}

final class RssFeedError extends RssFeedState {
  final ErrorState error;

  RssFeedError(this.error);
}
