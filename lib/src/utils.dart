import 'package:intl/intl.dart';
import 'package:timezone/standalone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class Utils {
  static String formatDateTime(DateTime dateTime) {
    final dateFormat = DateFormat("dd/MM/yyyy");
    final timeFormat = DateFormat("HH:mm");

    return "${dateFormat.format(dateTime)} ${timeFormat.format(dateTime)}";
  }

  static DateTime parseDate(String dateStr) {
    final dateTime = DateTime.parse(dateStr);
    return tz.TZDateTime.from(dateTime, tz.getLocation('Europe/Rome'));
  }

  static List<DateTime> parseLessonDates(Map<String, dynamic> lesson) {
    tz.initializeTimeZones();

    final start = parseDate(lesson['dataInizio']);
    final end = parseDate(lesson['dataFine']);

    return [start, end];
  }
}
