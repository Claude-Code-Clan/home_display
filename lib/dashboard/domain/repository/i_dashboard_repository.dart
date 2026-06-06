import 'package:home_display/dashboard/domain/entity/widget_positions.dart';

/// {@template IDashboardRepository}
///
/// {@endtemplate}
abstract interface class IDashboardRepository {
  Future<List<WidgetPosition>> getWidgetsPosition();
}
