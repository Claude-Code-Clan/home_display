import 'package:flutter/material.dart';
import 'package:home_display/dashboard/domain/entity/widgets_data.dart';

class StorageWidget extends StatelessWidget {
  const StorageWidget({required this.data, super.key});

  final StorageData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'Общих складов',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            data.publicStorage.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
          Text(
            'Частных складов',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            data.privateStorage.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
          Text(
            'Пустых складов',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            data.unassignedStorage.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
