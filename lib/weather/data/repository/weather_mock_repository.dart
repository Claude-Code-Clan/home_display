import 'package:home_display/weather/domain/entity/weather.dart';

import '../../domain/repository/i_weather_repository.dart';

/// {@template WeatherMockRepository}
///
/// {@endtemplate}
final class WeatherMockRepository implements IWeatherRepository {
  @override
  Future<Weather> getWeather() async {
    await Future.delayed(const Duration(seconds: 1));
    return Weather(
      humidity: 77,
      precType: 'RAIN',
      precStrength: 'STRONG',
      pressure: 758,
      temperature: 14,
      fahrenheit: 57,
      windSpeed: 6.7,
      windDirection: 'SOUTH_WEST',
      icon:
          'https://yastatic.net/weather/i/icons/confident/dark/svg/ovc_+ra.svg',
    );
  }
}
