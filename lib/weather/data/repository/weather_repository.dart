import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:home_display/weather/domain/entity/weather.dart';

import '../../domain/repository/i_weather_repository.dart';

/// {@template WeatherRepository}
///
/// {@endtemplate}
final class WeatherRepository implements IWeatherRepository {
  final http.Client _httpClient = http.Client();
  @override
  Future<Weather> getWeather() async {
    final response = await _httpClient.post(
      Uri.parse('https://api.weather.yandex.ru/graphql/query'),
      headers: {
        "X-Yandex-Weather-Key": dotenv.get('YA_WEATHER'),
        "Content-Type": "application/json",
      },
      body:
          "{\"query\":\"{\\n  weatherByPoint(request: {lat: 52.37125, lon: 4.89388}) {\\n    now {\\n      cloudiness\\n      humidity\\n      precType\\n      precStrength\\n      pressure\\n      temperature\\n      fahrenheit: temperature(unit: FAHRENHEIT)\\n      windSpeed\\n      windDirection\\n      icon(format: SVG)\\n    }\\n  }\\n}\"}",
    );

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final weather = Weather.fromMap(
      body['data']['weatherByPoint']['now'] as Map<String, dynamic>,
    );

    return weather;
  }
}

// const fetch = require('node-fetch');

// const promise = fetch('https://api.weather.yandex.ru/graphql/query', {
//     method: 'POST',
//     headers: {
//     "X-Yandex-Weather-Key": "2f42d403-a03c-4de1-a6ee-dbea49728c6d",
//     "Content-Type": "application/json"
// },
//     body: "{\"query\":\"{\\n  weatherByPoint(request: {lat: 52.37125, lon: 4.89388}) {\\n    now {\\n      cloudiness\\n      humidity\\n      precType\\n      precStrength\\n      pressure\\n      temperature\\n      fahrenheit: temperature(unit: FAHRENHEIT)\\n      windSpeed\\n      windDirection\\n      icon(format: SVG)\\n    }\\n  }\\n}\"}"
// });

// promise
//     .then(response => response.json())
//     .then(console.log);
