import 'package:flutter/material.dart';
import 'package:home_display/dashboard/domain/entity/widgets_data.dart';

class StorageWidget extends StatelessWidget {
  const StorageWidget({required this.data, super.key});

  final StorageData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'Доступно кладовых',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),
          ),
          const Spacer(),
          Text(
            data.publicStorage.toString(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
