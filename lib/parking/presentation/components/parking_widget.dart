import 'package:flutter/material.dart';
import 'package:home_display/dashboard/domain/entity/widgets_data.dart';

class ParkingWidget extends StatelessWidget {
  const ParkingWidget({required this.data, super.key});

  final ParkingSpotData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'Доступно парковочных мест на наземном паркинге',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),
          ),
          RichText(
            text: TextSpan(
              text: data.freePublicSpots.toString(),
              style: Theme.of(
                context,
              ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w600),
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
            'Зарезервированных парковочных мест',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),
          ),
          RichText(
            text: TextSpan(
              text: data.freePrivateSpots.toString(),
              style: Theme.of(
                context,
              ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w600),
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
