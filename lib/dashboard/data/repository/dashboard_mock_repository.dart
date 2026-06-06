import 'package:home_display/dashboard/domain/entity/card_data.dart';
import 'package:home_display/dashboard/domain/repository/i_dashboard_repository.dart';

/// {@template DashboardMockRepository}
///
/// {@endtemplate}
final class DashboardMockRepository implements IDashboardRepository {
  @override
  Future<List<CardData>> getCardsData() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      CardData(
        id: 1,
        xPos: 0,
        yPos: 0,
        width: 2,
        height: 2,
        type: 'example',
      ),
      CardData(
        id: 1,
        xPos: 0,
        yPos: 2,
        width: 1,
        height: 1,
        type: 'example',
      ),
      CardData(
        id: 1,
        xPos: 1,
        yPos: 2,
        width: 1,
        height: 1,
        type: 'example',
      ),
      CardData(
        id: 1,
        xPos: 2,
        yPos: 0,
        width: 1,
        height: 1,
        type: 'example',
      ),
      CardData(
        id: 1,
        xPos: 2,
        yPos: 1,
        width: 1,
        height: 2,
        type: 'example',
      ),
      CardData(
        id: 1,
        xPos: 3,
        yPos: 0,
        width: 2,
        height: 3,
        type: 'example',
      ),
      CardData(
        id: 1,
        xPos: 5,
        yPos: 0,
        width: 1,
        height: 1,
        type: 'example',
      ),
      CardData(
        id: 1,
        xPos: 5,
        yPos: 1,
        width: 1,
        height: 1,
        type: 'example',
      ),
      CardData(
        id: 1,
        xPos: 5,
        yPos: 2,
        width: 1,
        height: 1,
        type: 'example',
      ),
      CardData(
        id: 1,
        xPos: 5,
        yPos: 3,
        width: 1,
        height: 1,
        type: 'example',
      ),
      CardData(
        id: 1,
        xPos: 5,
        yPos: 4,
        width: 1,
        height: 1,
        type: 'example',
      ),
      CardData(
        id: 1,
        xPos: 0,
        yPos: 3,
        width: 5,
        height: 2,
        type: 'example',
      ),
    ];
  }
}
