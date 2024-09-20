import 'package:unipi_orario_wrapper/src/utils.dart';

class Lesson {
  final String name;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final String courseName;

  Lesson({
    required this.name,
    required this.startDateTime,
    required this.endDateTime,
    required this.courseName,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    final parsedDates = Utils.parseLessonDates(json);

    return Lesson(
      name: json['nome'],
      startDateTime: parsedDates[0],
      endDateTime: parsedDates[1],
      courseName: json['fattoreDiPartizione'][0]['partizioni'][0]['descrizione'],
    );
  }

  @override
  String toString() {
    return 'Lesson{name: $name, startDateTime: $startDateTime, endDateTime: $endDateTime, courseName: $courseName}';
  }
}
