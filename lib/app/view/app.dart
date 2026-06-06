import 'package:flutter/material.dart';
import 'package:home_display/dashboard/dashboard.dart';
import 'package:home_display/rss_feed/rss_feed.dart';
import 'package:home_display/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const Dashboard(),
    );
  }
}
