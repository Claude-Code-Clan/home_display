import 'package:home_display/dashboard/domain/entity/widget_positions.dart';
import 'package:home_display/dashboard/domain/repository/i_dashboard_repository.dart';

/// {@template DashboardMockRepository}
///
/// {@endtemplate}
final class DashboardMockRepository implements IDashboardRepository {
  @override
  Future<List<WidgetPosition>> getWidgetsPosition() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      WidgetPosition(
        id: 1,
        xPos: 0,
        yPos: 0,
        width: 2,
        height: 2,
        type: 'example',
      ),
      WidgetPosition(
        id: 2,
        xPos: 0,
        yPos: 2,
        width: 1,
        height: 1,
        type: 'example',
      ),
      WidgetPosition(
        id: 3,
        xPos: 1,
        yPos: 2,
        width: 1,
        height: 1,
        type: 'example',
      ),
      WidgetPosition(
        id: 4,
        xPos: 2,
        yPos: 0,
        width: 1,
        height: 1,
        type: 'example',
      ),
      WidgetPosition(
        id: 5,
        xPos: 2,
        yPos: 1,
        width: 1,
        height: 2,
        type: 'example',
      ),
      WidgetPosition(
        id: 6,
        xPos: 3,
        yPos: 0,
        width: 2,
        height: 3,
        type: 'example',
      ),
      WidgetPosition(
        id: 7,
        xPos: 5,
        yPos: 0,
        width: 1,
        height: 1,
        type: 'example',
      ),
      WidgetPosition(
        id: 8,
        xPos: 5,
        yPos: 1,
        width: 1,
        height: 1,
        type: 'example',
      ),
      WidgetPosition(
        id: 9,
        xPos: 5,
        yPos: 2,
        width: 1,
        height: 1,
        type: 'example',
      ),
      WidgetPosition(
        id: 10,
        xPos: 5,
        yPos: 3,
        width: 1,
        height: 1,
        type: 'example',
      ),
      WidgetPosition(
        id: 11,
        xPos: 5,
        yPos: 4,
        width: 1,
        height: 1,
        type: 'example',
      ),
      WidgetPosition(
        id: 12,
        xPos: 0,
        yPos: 3,
        width: 5,
        height: 2,
        type: 'example',
      ),
    ];
  }
}
