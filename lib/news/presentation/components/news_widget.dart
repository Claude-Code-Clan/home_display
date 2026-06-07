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
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'data.articles[i].title',
                      style:
                          Theme.of(
                            context,
                          ).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '''
data.articles[i].description
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
