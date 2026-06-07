import 'package:flutter/material.dart';
import 'package:home_display/core/helpers.dart';
import 'package:rss_feed/rss_feed.dart';

class RssBase extends StatelessWidget {
  const RssBase({
    required this.height,
    required this.width,
    required this.item,
    super.key,
  });

  final double height;
  final double width;
  final RssItem item;

  @override
  Widget build(BuildContext context) {
    final imageUrl = FeedParser.getImageUrl(item);

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
            if (imageUrl != null) ...[
              Image.network(
                imageUrl,
                height: height * 0.3,
                width: width,
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
              top: imageUrl == null ? 8 : height * 0.31,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    parseRssDate(item.pubDate),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    item.title ?? 'No title',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (item.description?.trim().isNotEmpty == true) ...[
                    const SizedBox(height: 4),
                    Text(
                      item.description!,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
