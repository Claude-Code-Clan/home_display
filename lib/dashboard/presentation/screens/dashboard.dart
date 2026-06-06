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
  final double gridSpacing = 10;

  late double screenHeight;
  late double screenWidth;

  @override
  void initState() {
    final mediaQueryData = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.first,
    );
    screenHeight = mediaQueryData.size.height;
    screenWidth = mediaQueryData.size.width;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.of(context).bg_jpg),
            fit: BoxFit.cover,
          ),
        ),

        child: BlocBuilder<DashboardGridBloc, DashboardGridState>(
          builder: (context, state) {
            switch (state) {
              case DashboardGridInitial _:
                return const Center(child: Text('Initializing...'));
              case DashboardGridLoading _:
                return const Center(child: CircularProgressIndicator());
              case final DashboardGridLoaded state:
                final cardsData = state.cardsData;
                return Stack(
                  children: cardsData
                      .map(
                        (cardData) => CardWidget(
                          card: cardData,
                          scaleH: screenHeight / gridHeight,
                          scaleW: screenWidth / gridWidth,
                          padding: gridSpacing,
                        ),
                      )
                      .toList(),
                );
              case final DashboardGridError state:
                final errorMessage = state.message.message;
                return Center(child: Text('Error: $errorMessage'));
            }
          },
        ),
      ),
    );
  }
}
