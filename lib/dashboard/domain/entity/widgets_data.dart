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

final class ParkingSpotData extends WidgetsData {
  ParkingSpotData({
    required super.id,
    required this.freePublicSpots,
    required this.totalPublicSpots,
    required this.freePrivateSpots,
    required this.totalPrivateSpots,
  });

  final int freePublicSpots;
  final int totalPublicSpots;

  final int freePrivateSpots;
  final int totalPrivateSpots;
}

final class StorageData extends WidgetsData {
  StorageData({
    required super.id,
    required this.publicStorage,
    required this.unassignedStorage,
    required this.privateStorage,
  });

  final int publicStorage;
  final int unassignedStorage;
  final int privateStorage;
}

final class NewsData extends WidgetsData {
  NewsData({
    required super.id,
    required this.status,
    required this.title,
    required this.text,
    required this.date,
    required this.expiresAt,
    required this.scheduledFor,
    required this.images,
    required this.type,
  });

  final int status;
  final String title;
  final String text;
  final DateTime date;
  final DateTime expiresAt;
  final DateTime scheduledFor;
  final List<String> images;
  final String type;
}
