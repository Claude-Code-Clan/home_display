part of 'dashboard_grid_bloc.dart';

@immutable
sealed class DashboardGridState {}

final class DashboardGridInitial extends DashboardGridState {}

final class DashboardGridLoading extends DashboardGridState {}

final class DashboardGridLoaded extends DashboardGridState {
  DashboardGridLoaded({required this.cardsData});

  final List<CardData> cardsData;
}

final class DashboardGridError extends DashboardGridState {
  DashboardGridError(this.message);

  final ErrorState message;
}
