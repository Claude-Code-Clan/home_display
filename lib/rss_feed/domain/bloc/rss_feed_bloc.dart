import 'package:bloc/bloc.dart';
import 'package:home_display/core/consts.dart';
import 'package:home_display/rss_feed/domain/repository/i_rss_feed_repository.dart';
import 'package:meta/meta.dart';
import 'package:rss_feed/rss_feed.dart';

part 'rss_feed_event.dart';
part 'rss_feed_state.dart';

class RssFeedBloc extends Bloc<RssFeedEvent, RssFeedState> {
  RssFeedBloc(this._repository) : super(RssFeedInitial()) {
    on<LoadRssFeed>(_onLoadRssFeed);
  }

  final IRssFeedRepository _repository;

  Future<void> _onLoadRssFeed(
    LoadRssFeed event,
    Emitter<RssFeedState> emit,
  ) async {
    emit(RssFeedLoading());

    try {
      emit(RssFeedLoading()); // Emit empty state immediately for better UX
      final items = await _repository.getFeed(event.url);
      emit(RssFeedLoaded(items));
    } catch (e) {
      emit(RssFeedError(ErrorState(message: e.toString(), title: 'Error')));
    }
  }
}
