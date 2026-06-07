import 'package:flutter/material.dart';
import 'package:home_display/core/helpers.dart';
import 'package:rss_feed/rss_feed.dart';

class RssMini extends StatelessWidget {
  const RssMini({
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
      margin: const EdgeInsets.all(32),
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
                height: height * 0.8,
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
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.surface.withAlpha(0),
                      Theme.of(context).colorScheme.surface.withAlpha(0),
                      Theme.of(context).colorScheme.surface.withAlpha(125),
                      Theme.of(context).colorScheme.surface,
                      Theme.of(context).colorScheme.surface,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
            Positioned(
              left: 16,
              right: 16,
              top: imageUrl == null ? 16 : null,
              // bottom: imageUrl != null ? 8 : null,
              bottom: 16,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    parseRssDate(item.pubDate),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    item.title ?? 'No title',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (item.description?.trim().isNotEmpty == true &&
                      imageUrl == null) ...[
                    const SizedBox(height: 4),
                    Expanded(
                      child: Text(
                        item.description!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        softWrap: true,
                      ),
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
