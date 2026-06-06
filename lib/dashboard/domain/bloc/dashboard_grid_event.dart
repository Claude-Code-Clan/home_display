part of 'dashboard_grid_bloc.dart';

@immutable
sealed class DashboardGridEvent {}

final class DashboardGridLoad extends DashboardGridEvent {
  DashboardGridLoad();
}

final class DashboardDataLoad extends DashboardGridEvent {
  DashboardDataLoad(Set<int> widgetIds);
}

final class DashboardGridUpdate extends DashboardGridEvent {
  DashboardGridUpdate();
}
