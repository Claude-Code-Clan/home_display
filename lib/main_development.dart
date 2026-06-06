import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:home_display/app/app.dart';
import 'package:home_display/bootstrap.dart';

Future<void> main() async {
  await dotenv.load();
  await bootstrap(() => const App());
}
