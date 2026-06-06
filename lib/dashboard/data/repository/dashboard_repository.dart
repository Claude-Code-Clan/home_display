import 'package:home_display/dashboard/domain/entity/widget_positions.dart';

import '../../domain/repository/i_dashboard_repository.dart';

/// {@template DashboardRepository}
///
/// {@endtemplate}
final class DashboardRepository implements IDashboardRepository {
  @override
  Future<List<WidgetPosition>> getWidgetsPosition() async {
    throw UnimplementedError();
  }
}
