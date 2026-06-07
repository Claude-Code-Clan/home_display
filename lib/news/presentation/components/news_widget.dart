import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:home_display/core/helpers.dart';
import 'package:home_display/dashboard/domain/entity/widgets_data.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    required this.data,
    required this.height,
    required this.width,
    super.key,
  });

  final NewsData data;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        autoPlay: true,
        viewportFraction: 1,
        autoPlayInterval: const Duration(seconds: 5),
      ),
      items: [1, 2, 3]
          .map(
            (i) => Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Синицы',
                      style:
                          Theme.of(
                            context,
                          ).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '''
Новости нашего двора. Синицы объелись забродившей рябины и гуляют по травке пошатываясь. Если бы синицы могли улыбаться, то они точно бы улыбались
''',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
