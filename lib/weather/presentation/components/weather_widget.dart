import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_display/dashboard/domain/entity/widgets_data.dart';
import 'package:home_display/weather/data/repository/weather_repository.dart';
import 'package:home_display/weather/domain/entity/weather.dart';
import 'package:home_display/weather/domain/repository/i_weather_repository.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({required this.data, super.key});

  final WeatherData data;

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final IWeatherRepository repository = WeatherRepository();

  Weather? weather;

  @override
  void initState() {
    super.initState();
    unawaited(getWeather());
  }

  Future<void> getWeather() async {
    final result = await repository.getWeather();

    if (!mounted) return;

    setState(() {
      weather = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              RichText(
                text: TextSpan(
                  text: '${weather?.temperature ?? '--'}°C',
                  style: Theme.of(context).textTheme.headlineMedium,
                  children: [
                    TextSpan(
                      text: ' / ${weather?.fahrenheit ?? '--'}°F',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface.withAlpha(200),
                  shape: BoxShape.circle,
                ),
                child: weather != null
                    ? SvgPicture.network(
                        weather?.icon ?? '',
                        width: 48,
                        height: 48,
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox(
                              width: 48,
                              height: 48,
                            ),
                      )
                    : const SizedBox(
                        width: 48,
                        height: 48,
                      ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                '${weather?.windSpeed ?? 'N/A'} mph 💨',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              Text(
                '${weather?.humidity ?? 'N/A'}% 💧',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
