// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Weather {
  Weather({
    required this.humidity,
    required this.precType,
    required this.precStrength,
    required this.pressure,
    required this.temperature,
    required this.fahrenheit,
    required this.windSpeed,
    required this.windDirection,
    required this.icon,
  });

  final int humidity;
  final String precType;
  final String precStrength;
  final int pressure;
  final int temperature;
  final int fahrenheit;
  final double windSpeed;
  final String windDirection;
  final String icon;

  Weather copyWith({
    int? humidity,
    String? precType,
    String? precStrength,
    int? pressure,
    int? temperature,
    int? fahrenheit,
    double? windSpeed,
    String? windDirection,
    String? icon,
  }) {
    return Weather(
      humidity: humidity ?? this.humidity,
      precType: precType ?? this.precType,
      precStrength: precStrength ?? this.precStrength,
      pressure: pressure ?? this.pressure,
      temperature: temperature ?? this.temperature,
      fahrenheit: fahrenheit ?? this.fahrenheit,
      windSpeed: windSpeed ?? this.windSpeed,
      windDirection: windDirection ?? this.windDirection,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'humidity': humidity,
      'precType': precType,
      'precStrength': precStrength,
      'pressure': pressure,
      'temperature': temperature,
      'fahrenheit': fahrenheit,
      'windSpeed': windSpeed,
      'windDirection': windDirection,
      'icon': icon,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      humidity: map['humidity'] as int,
      precType: map['precType'] as String,
      precStrength: map['precStrength'] as String,
      pressure: map['pressure'] as int,
      temperature: map['temperature'] as int,
      fahrenheit: map['fahrenheit'] as int,
      windSpeed: map['windSpeed'] as double,
      windDirection: map['windDirection'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Weather(humidity: $humidity, precType: $precType, precStrength: $precStrength, pressure: $pressure, temperature: $temperature, fahrenheit: $fahrenheit, windSpeed: $windSpeed, windDirection: $windDirection, icon: $icon)';
  }

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.humidity == humidity &&
        other.precType == precType &&
        other.precStrength == precStrength &&
        other.pressure == pressure &&
        other.temperature == temperature &&
        other.fahrenheit == fahrenheit &&
        other.windSpeed == windSpeed &&
        other.windDirection == windDirection &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return humidity.hashCode ^
        precType.hashCode ^
        precStrength.hashCode ^
        pressure.hashCode ^
        temperature.hashCode ^
        fahrenheit.hashCode ^
        windSpeed.hashCode ^
        windDirection.hashCode ^
        icon.hashCode;
  }
}
