import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:home_display/core/consts.dart';
import 'package:home_display/dashboard/dashboard.dart';
import 'package:home_display/dashboard/domain/entity/alerts.dart';
import 'package:home_display/dashboard/domain/entity/widget_positions.dart';
import 'package:home_display/dashboard/domain/entity/widgets_data.dart';
import 'package:meta/meta.dart';

part 'dashboard_grid_event.dart';
part 'dashboard_grid_state.dart';

class DashboardGridBloc extends Bloc<DashboardGridEvent, DashboardGridState> {
  final IDashboardRepository _repository;
  Timer? _dataUpdateTimer;

  DashboardGridBloc({required IDashboardRepository repository})
    : _repository = repository,
      super(DashboardGridInitial()) {
    on<DashboardGridLoad>(_onLoadCards);
    on<DashboardDataLoad>(_onLoadData);
    on<DashboardGridUpdate>(_onDashboardGridUpdate);

    add(DashboardGridLoad());
  }

  Future<void> _onLoadCards(
    DashboardGridEvent event,
    Emitter<DashboardGridState> emit,
  ) async {
    try {
      emit(DashboardGridLoading());
      final data = await _repository.getWidgetsPosition();
      emit(DashboardGridLoaded(widgetData: data));

      add(DashboardDataLoad(data.keys.toSet()));
      _dataUpdateTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
        add(DashboardGridUpdate());
      });
    } catch (error, stackTrace) {
      log('Error loading cards: $error', stackTrace: stackTrace);
      emit(
        DashboardError(
          ErrorState(title: 'Failed to load cards', message: error.toString()),
        ),
      );
    }
  }

  Future<void> _onLoadData(
    DashboardDataLoad event,
    Emitter<DashboardGridState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is! DashboardGridLoaded) return;

      currentState.widgetData.keys.toSet();
      final data = await _repository.getWidgetsData(currentState.widgetData);

      emit(
        DashboardDataLoaded(
          widgetData: currentState.widgetData,
          widgetsData: data,
        ),
      );
    } catch (error, stackTrace) {
      log('Error loading card data: $error', stackTrace: stackTrace);
      emit(
        DashboardError(
          ErrorState(
            title: 'Failed to load card data',
            message: error.toString(),
          ),
        ),
      );
    }
  }

  Future<void> _onDashboardGridUpdate(
    DashboardGridUpdate event,
    Emitter<DashboardGridState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is! DashboardDataLoaded) return;

      final data = await _repository.getWidgetsPosition();
      final widgetsData = await _repository.getWidgetsData(data);
      final alerts = await _repository.getAlerts();

      emit(
        DashboardDataLoaded(
          widgetData: data,
          widgetsData: widgetsData,
          alerts: alerts,
        ),
      );
    } catch (error, stackTrace) {
      log('Error updating card data: $error', stackTrace: stackTrace);
      emit(
        DashboardError(
          ErrorState(
            title: 'Failed to update card data',
            message: error.toString(),
          ),
        ),
      );
    }
  }
}
