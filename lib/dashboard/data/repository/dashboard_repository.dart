import 'dart:convert';
import 'dart:math';

import 'package:home_display/core/consts.dart';
import 'package:home_display/dashboard/domain/entity/alerts.dart';
import 'package:home_display/dashboard/domain/entity/widget_positions.dart';
import 'package:home_display/dashboard/domain/entity/widgets_data.dart';
import 'package:home_display/dashboard/domain/repository/i_dashboard_repository.dart';
import 'package:http/http.dart' as http;

/// {@template DashboardRepository}
///
/// {@endtemplate}
final class DashboardRepository implements IDashboardRepository {
  final http.Client _httpClient = http.Client();

  @override
  Future<Map<int, WidgetPosition>> getWidgetsPosition() async {
    final response = await _httpClient.post(
      Uri.parse('$hostUrl/api/v1/Get/get-widgets'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          'deviceIds': [1],
        },
      ),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(
        'Failed to get widgets position. '
        'Status code: ${response.statusCode}, body: ${response.body}',
      );
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;

    final devices = body['devices'] as List<dynamic>? ?? [];

    final result = <int, WidgetPosition>{};

    for (final device in devices) {
      final deviceMap = device as Map<String, dynamic>;
      final widgets = deviceMap['widgets'] as List<dynamic>? ?? [];

      for (final widget in widgets) {
        final widgetPosition = WidgetPosition.fromMap(
          widget as Map<String, dynamic>,
        );

        result[widgetPosition.id] = widgetPosition;
      }
    }

    return result;
  }

  @override
  Future<Map<int, WidgetsData>> getWidgetsData(
    Map<int, WidgetPosition> widgetsPositions,
  ) async {
    final data = <int, WidgetsData>{};

    await Future.delayed(const Duration(seconds: 1));

    for (final entry in widgetsPositions.entries) {
      final widgetId = entry.key;
      final widgetPosition = entry.value;
      final widgetType = WidgetType.fromName(widgetPosition.type);

      switch (widgetType) {
        case WidgetType.rss:
          data[widgetId] = RssFeedData(
            id: widgetId,
            feedUrl: Random.secure().nextBool()
                ? 'https://www.thehindu.com/feeder/default.rss'
                : 'https://rg.ru/xml/index.xml',
          );

        case WidgetType.camera:
          data[widgetId] = HlsVideoData(
            id: widgetId,
            videoUrl: 'https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8',
          );

        case WidgetType.staticinfo:
          data[widgetId] = InformationData(
            id: widgetId,
            markdownData: '''
### Номер УК
> Путин запретил указывать номер управляющей компании в квитанциях на оплату ЖКУ

`
  print('Я запрещаю вам срать в подъезде');
`

Lorem markdownum capillos tegi auribus erat limitibus grande requie, est tamen
*atque varios Insula* miserarum Pallas. Monte bracchia crescendo referri
velle.
''',
          );

        case WidgetType.parking:
          data[widgetId] = ParkingSpotData(
            id: widgetId,
            freePublicSpots: Random.secure().nextInt(100),
            totalPublicSpots: Random.secure().nextInt(100) + 100,
            freePrivateSpots: Random.secure().nextInt(100),
            totalPrivateSpots: Random.secure().nextInt(100) + 100,
          );

        case WidgetType.storage:
          data[widgetId] = StorageData(
            id: widgetId,
            publicStorage: Random.secure().nextInt(100),
            unassignedStorage: Random.secure().nextInt(100),
            privateStorage: Random.secure().nextInt(100),
          );

        case WidgetType.weather:
          data[widgetId] = WeatherData(
            id: widgetId,
            temperature: Random.secure().nextInt(500) / 10 - 25,
          );
        case WidgetType.news:
          data[widgetId] = NewsData(
            id: widgetId,
            status: 2,
            title: '',
            text: '',
            date: DateTime.now(),
            expiresAt: DateTime.now().add(const Duration(days: 7)),
            scheduledFor: DateTime.now(),
            images: [],
            type: '',
          );
      }
    }

    return data;
  }

  @override
  Future<Alerts?> getAlerts() async {
    final response = await _httpClient.post(
      Uri.parse('$hostUrl/api/v1/Get/get-alerts'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'deviceIds': [1],
      }),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(
        'Failed to get alerts: ${response.statusCode} ${response.body}',
      );
    }

    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    final alerts = decoded['alerts'] as List<dynamic>? ?? [];

    if (alerts.isEmpty) return null;

    return Alerts.fromMap(alerts.first as Map<String, dynamic>);
  }
}
