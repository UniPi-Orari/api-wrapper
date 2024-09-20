import 'package:unipi_orario_wrapper/unipi_orario_wrapper.dart';

void main(List<String> args) async {
  final wrapper = WrapperService();
  List<dynamic> lessons = await wrapper.fetchLessons(
    calendarId: "6319d930e209821793111b45",
    clientId: "628de8b9b63679f193b87046",
    startDate: DateTime.now(),
    endDate: DateTime.now().add(Duration(days: 7)),
  );

  for (var lesson in lessons) {
    print(lesson);
  }
}
