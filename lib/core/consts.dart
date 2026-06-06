import 'package:flutter_dotenv/flutter_dotenv.dart';

class ErrorState {
  ErrorState({required this.title, required this.message});

  final String title;
  final String message;
}

final String hostUrl = dotenv.env['HOST_URL']!;

enum WidgetType {
  rss(0),
  hls(1),
  staticinfo(2),
  parking(3),
  storage(4),
  weather(5)
  ;

  const WidgetType(this.id);

  final int id;

  static WidgetType fromName(String name) {
    return WidgetType.values.firstWhere(
      (type) => type.name == name,
      orElse: () => throw Exception('Unknown widget type name: $name'),
    );
  }

  static WidgetType fromId(int id) {
    return WidgetType.values.firstWhere(
      (type) => type.id == id,
      orElse: () => throw Exception('Unknown widget type id: $id'),
    );
  }
}
