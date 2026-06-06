import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:home_display/consts/consts.dart';
import 'package:home_display/dashboard/dashboard.dart';
import 'package:home_display/dashboard/domain/entity/widget_positions.dart';
import 'package:meta/meta.dart';

part 'dashboard_grid_event.dart';
part 'dashboard_grid_state.dart';

class DashboardGridBloc extends Bloc<DashboardGridEvent, DashboardGridState> {
  final IDashboardRepository _repository;

  DashboardGridBloc({required IDashboardRepository repository})
    : _repository = repository,
      super(DashboardGridInitial()) {
    on<DashboardGridLoad>(_onLoadCards);

    add(DashboardGridLoad());
  }

  Future<void> _onLoadCards(
    DashboardGridEvent event,
    Emitter<DashboardGridState> emit,
  ) async {
    try {
      emit(DashboardGridLoading());
      final data = await _repository.getWidgetsPosition();
      emit(DashboardGridLoaded(cardsData: data));
    } catch (error, stackTrace) {
      log('Error loading cards: $error', stackTrace: stackTrace);
      emit(
        DashboardGridError(
          ErrorState(title: 'Failed to load cards', message: error.toString()),
        ),
      );
    }
  }
}
