import 'package:home_display/dashboard/domain/entity/card_data.dart';

/// {@template IDashboardRepository}
///
/// {@endtemplate}
abstract interface class IDashboardRepository {
  Future<List<CardData>> getCardsData();
}
