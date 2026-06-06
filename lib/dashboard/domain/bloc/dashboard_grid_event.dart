part of 'dashboard_grid_bloc.dart';

@immutable
sealed class DashboardGridEvent {}

final class DashboardGridLoad extends DashboardGridEvent {
  DashboardGridLoad({required this.cardsData});

  final List<CardData> cardsData;
}
