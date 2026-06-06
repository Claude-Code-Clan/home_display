import 'package:home_display/weather/domain/entity/weather.dart';

/// {@template IWeatherRepository}
///
/// {@endtemplate}
abstract interface class IWeatherRepository {
  Future<Weather> getWeather();
}
