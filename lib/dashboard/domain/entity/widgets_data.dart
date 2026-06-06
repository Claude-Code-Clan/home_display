interface class WidgetsData {
  WidgetsData({required this.id});

  int id;
}

final class RssFeedData extends WidgetsData {
  RssFeedData({required super.id, required this.feedUrl});

  final String feedUrl;
}

final class HlsVideoData extends WidgetsData {
  HlsVideoData({required super.id, required this.videoUrl});

  final String videoUrl;
}

final class InformationData extends WidgetsData {
  InformationData({required super.id, required this.markdownData});

  final String markdownData;
}
