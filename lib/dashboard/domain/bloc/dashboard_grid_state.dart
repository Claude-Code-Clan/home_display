part of 'dashboard_grid_bloc.dart';

@immutable
sealed class DashboardGridState {}

final class DashboardGridInitial extends DashboardGridState {}

final class DashboardGridLoading extends DashboardGridState {}

final class DashboardGridLoaded extends DashboardGridState {
  DashboardGridLoaded({required this.widgetData});

  final Map<int, WidgetPosition> widgetData;
}

final class DashboardDataLoaded extends DashboardGridState {
  DashboardDataLoaded({
    required this.widgetData,
    required this.widgetsData,
    this.alerts,
  });

  final Map<int, WidgetPosition> widgetData;
  final Map<int, WidgetsData> widgetsData;
  final Alerts? alerts;
}

final class DashboardError extends DashboardGridState {
  DashboardError(this.message);

  final ErrorState message;
}
