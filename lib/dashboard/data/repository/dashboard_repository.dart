import 'package:home_display/dashboard/domain/entity/card_data.dart';

import '../../domain/repository/i_dashboard_repository.dart';

/// {@template DashboardRepository}
///
/// {@endtemplate}
final class DashboardRepository implements IDashboardRepository {
  @override
  Future<List<CardData>> getCardsData() async {
    throw UnimplementedError();
  }
}
