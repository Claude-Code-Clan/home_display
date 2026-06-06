import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
      body: Center(
        child: Text(
          'Dashboard/n Screen Height: $screenHeight/n Screen Width: $screenWidth',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
