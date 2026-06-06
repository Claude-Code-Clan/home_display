import 'package:home_display/app/app.dart';
import 'package:home_display/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
