import 'dart:math';

import 'package:home_display/dashboard/domain/entity/widget_positions.dart';
import 'package:home_display/dashboard/domain/entity/widgets_data.dart';
import 'package:home_display/dashboard/domain/repository/i_dashboard_repository.dart';

/// {@template DashboardMockRepository}
///
/// {@endtemplate}
final class DashboardMockRepository implements IDashboardRepository {
  @override
  Future<Map<int, WidgetPosition>> getWidgetsPosition() async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      1: WidgetPosition(
        id: 1,
        xPos: 0,
        yPos: 0,
        width: 2,
        height: 2,
        type: 'example',
      ),
      2: WidgetPosition(
        id: 2,
        xPos: 0,
        yPos: 2,
        width: 1,
        height: 1,
        type: 'example',
      ),
      3: WidgetPosition(
        id: 3,
        xPos: 1,
        yPos: 2,
        width: 1,
        height: 1,
        type: 'example',
      ),
      4: WidgetPosition(
        id: 4,
        xPos: 2,
        yPos: 0,
        width: 1,
        height: 1,
        type: 'example',
      ),
      5: WidgetPosition(
        id: 5,
        xPos: 2,
        yPos: 1,
        width: 1,
        height: 2,
        type: 'example',
      ),
      6: WidgetPosition(
        id: 6,
        xPos: 3,
        yPos: 0,
        width: 2,
        height: 3,
        type: 'example',
      ),
      7: WidgetPosition(
        id: 7,
        xPos: 5,
        yPos: 0,
        width: 1,
        height: 1,
        type: 'example',
      ),
      8: WidgetPosition(
        id: 8,
        xPos: 5,
        yPos: 1,
        width: 1,
        height: 1,
        type: 'example',
      ),
      9: WidgetPosition(
        id: 9,
        xPos: 5,
        yPos: 2,
        width: 1,
        height: 1,
        type: 'example',
      ),
      10: WidgetPosition(
        id: 10,
        xPos: 5,
        yPos: 3,
        width: 1,
        height: 1,
        type: 'example',
      ),
      11: WidgetPosition(
        id: 11,
        xPos: 5,
        yPos: 4,
        width: 1,
        height: 1,
        type: 'example',
      ),
      12: WidgetPosition(
        id: 12,
        xPos: 0,
        yPos: 3,
        width: 5,
        height: 2,
        type: 'example',
      ),
    };
  }

  @override
  Future<Map<int, WidgetsData>> getWidgetsData(Set<int> widgetIds) async {
    final data = <int, WidgetsData>{};

    await Future.delayed(const Duration(seconds: 1));

    for (final widgetId in widgetIds) {
      final rand = Random.secure().nextInt(4);
      switch (rand) {
        case 0:
          data[widgetId] = RssFeedData(
            id: widgetId,
            feedUrl: Random.secure().nextBool()
                ? 'https://www.thehindu.com/feeder/default.rss'
                : 'https://rg.ru/xml/index.xml',
          );
        case 1:
          data[widgetId] = HlsVideoData(
            id: widgetId,
            videoUrl: 'https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8',
          );
        case 2:
          data[widgetId] = InformationData(
            id: widgetId,
            markdownData: '''
  ### Номер УК
  > Путин запретил указывать номер управляющей компании в квитанциях на оплату ЖКУ

  `
    print('Я запрещаю вам срать в подъезде');
  `
  Lorem markdownum capillos tegi auribus erat limitibus grande requie, est tamen
  *atque varios Insula* miserarum Pallas. Monte bracchia **crescendo** referri
  velle.
  ''',
          );
        case 3:
          data[widgetId] = ParkingSpotData(
            id: widgetId,
            freePublicSpots: Random.secure().nextInt(100),
            totalPublicSpots: Random.secure().nextInt(100) + 100,
            freePrivateSpots: Random.secure().nextInt(100),
            totalPrivateSpots: Random.secure().nextInt(100) + 100,
          );
        default:
      }
    }

    return data;
  }
}
