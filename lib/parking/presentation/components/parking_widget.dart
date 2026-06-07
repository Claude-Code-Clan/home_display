import 'package:flutter/material.dart';
import 'package:home_display/dashboard/domain/entity/widgets_data.dart';

class ParkingWidget extends StatelessWidget {
  const ParkingWidget({required this.data, super.key});

  final ParkingSpotData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'Общих парковок',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          RichText(
            text: TextSpan(
              text: data.freePublicSpots.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
              children: [
                TextSpan(
                  text: ' / ${data.totalPublicSpots}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            'Частных парковок',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          RichText(
            text: TextSpan(
              text: data.freePrivateSpots.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
              children: [
                TextSpan(
                  text: ' / ${data.totalPrivateSpots}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
