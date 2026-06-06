import 'package:intl/intl.dart';

String parseRssDate(String? value) {
  if (value == null || value.trim().isEmpty) {
    return DateFormat('dd.MM.yy HH:mm').format(DateTime.now());
  }

  try {
    final d = DateFormat(
      'EEE, dd MMM yyyy HH:mm:ss Z',
      'en_US',
    ).parseUtc(value.trim());

    return DateFormat('dd.MM.yy HH:mm').format(d);
  } catch (_) {
    return DateFormat('dd.MM.yy HH:mm').format(DateTime.now());
  }
}
