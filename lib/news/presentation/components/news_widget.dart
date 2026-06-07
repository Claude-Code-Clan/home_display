import 'package:flutter/material.dart';
import 'package:home_display/core/helpers.dart';
import 'package:home_display/dashboard/domain/entity/widgets_data.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({required this.data, super.key});

  final NewsData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            if (data.images != null) ...[
              Image.network(
                data.images.first,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return const SizedBox(
                    width: 72,
                    height: 72,
                    child: Icon(Icons.rss_feed),
                  );
                },
              ),
            ],
            Positioned(
              left: 8,
              right: 8,
              top: data.images == null ? 8 : 100 * 0.31,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    '${data.date.day}.${data.date.month}.${data.date.year}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    data.title ?? 'No title',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (data.text?.trim().isNotEmpty == true) ...[
                    const SizedBox(height: 4),
                    Text(
                      data.text!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      softWrap: true,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
