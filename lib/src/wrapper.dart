import 'package:unipi_orario_wrapper/src/models/lesson.dart';
import 'package:unipi_orario_wrapper/src/service/wrapper_api_service.dart';

class WrapperService {
  final WrapperApiService apiService = WrapperApiService();

  Future<List<dynamic>> fetchLessons({
    required String calendarId,
    String? clientId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    if (clientId == null || clientId.isEmpty) {
      final clientData = await apiService.getClientId("unipi.prod.up.cineca.it");
      clientId = clientData['id'];
      print(clientId);
    }

    final lessons = await apiService.getLessons(calendarId, clientId!, startDate, endDate);
    return lessons;
  }

  Future<List<Lesson>> fetchLessonsObj({
    required String calendarId,
    String? clientId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    if (clientId == null || clientId.isEmpty) {
      final clientData = await apiService.getClientId("unipi.prod.up.cineca.it");
      clientId = clientData['id'];
      print(clientId);
    }

    final lessons = await apiService.getLessons(calendarId, clientId!, startDate, endDate);

    var lessonsList = <Lesson>[];
    for (var lesson in lessons) {
      final lessonObj = Lesson.fromJson(lesson);
      lessonsList.add(lessonObj);
    }

    return lessonsList;
  }
}
