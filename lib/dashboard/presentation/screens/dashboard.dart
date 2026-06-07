import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_display/assets/assets.dart';
import 'package:home_display/dashboard/domain/bloc/dashboard_grid_bloc.dart';
import 'package:home_display/dashboard/presentation/components/card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final double gridWidth = 6;
  final double gridHeight = 5;

  final double padding = 10;
  final double gridSpacing = 8;

  late double screenHeight;
  late double screenWidth;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.sizeOf(context);
    screenHeight = mediaQueryData.height;
    screenWidth = mediaQueryData.width;
    return Scaffold(
      body: BlocListener<DashboardGridBloc, DashboardGridState>(
        listenWhen: (previous, current) {
          if (current is! DashboardDataLoaded) return false;

          final previousAlert = previous is DashboardDataLoaded
              ? previous.alerts?.alert
              : null;

          final currentAlert = current.alerts?.alert;

          return previousAlert != currentAlert;
        },
        listener: (context, state) {
          if (state is! DashboardDataLoaded) return;

          final messenger = ScaffoldMessenger.of(context);
          final alert = state.alerts;

          messenger.hideCurrentMaterialBanner();

          if (alert == null) {
            return;
          }

          messenger.showMaterialBanner(
            MaterialBanner(
              content: Text(alert.alert),
              leading: const Icon(
                Icons.error,
                // color: Colors.white,
              ),
              actions: [
                TextButton(
                  onPressed: messenger.hideCurrentMaterialBanner,
                  child: const Text('ОК'),
                ),
              ],
            ),
          );
        },
        child: BlocBuilder<DashboardGridBloc, DashboardGridState>(
          builder: (context, state) {
            switch (state) {
              case DashboardGridInitial _:
                return const Center(child: Text('Initializing...'));
              case DashboardGridLoading _:
                return const Center(child: CircularProgressIndicator());
              case final DashboardGridLoaded state:
                final cardsData = state.widgetData;
                return Stack(
                  children: cardsData.values
                      .map(
                        (cardData) => CardWidget(
                          card: cardData,
                          scaleH: screenHeight / gridHeight,
                          scaleW: screenWidth / gridWidth,
                          padding: gridSpacing,
                          data: null,
                        ),
                      )
                      .toList(),
                );
              case final DashboardDataLoaded state:
                final cardsData = state.widgetData;
                return Stack(
                  children: cardsData.values
                      .map(
                        (cardData) => CardWidget(
                          card: cardData,
                          scaleH: screenHeight / gridHeight,
                          scaleW: screenWidth / gridWidth,
                          padding: gridSpacing,
                          data: state.widgetsData[cardData.id],
                        ),
                      )
                      .toList(),
                );
              case final DashboardError state:
                final errorMessage = state.message.message;
                return Center(child: Text('Error: $errorMessage'));
            }
          },
        ),
      ),
    );
  }
}
