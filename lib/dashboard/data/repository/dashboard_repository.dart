import 'package:home_display/dashboard/domain/entity/widget_positions.dart';
import 'package:home_display/dashboard/domain/entity/widgets_data.dart';

import '../../domain/repository/i_dashboard_repository.dart';

/// {@template DashboardRepository}
///
/// {@endtemplate}
final class DashboardRepository implements IDashboardRepository {
  @override
  Future<Map<int, WidgetPosition>> getWidgetsPosition() async {
    throw UnimplementedError();
  }

  @override
  Future<Map<int, WidgetsData>> getWidgetsData(Set<int> widgetIds) {
    // TODO: implement getWidgetsData
    throw UnimplementedError();
  }
}
