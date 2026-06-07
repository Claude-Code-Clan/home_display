import 'package:home_display/dashboard/domain/entity/alerts.dart';
import 'package:home_display/dashboard/domain/entity/widget_positions.dart';
import 'package:home_display/dashboard/domain/entity/widgets_data.dart';

/// {@template IDashboardRepository}
///
/// {@endtemplate}
abstract interface class IDashboardRepository {
  Future<Map<int, WidgetPosition>> getWidgetsPosition();

  Future<Map<int, WidgetsData>> getWidgetsData(
    Map<int, WidgetPosition> widgetsPositions,
  );

  Future<Alerts?> getAlerts();
}
