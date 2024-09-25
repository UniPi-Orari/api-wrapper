
# Wrapper Library

The `wrapper` library provides two functions for fetching lessons from a remote service.

## Installation

Add the `wrapper` package to your `pubspec.yaml`:

```yaml
dependencies:
  unipi_orario_wrapper:
    git:
      url: https://github.com/your_repo/unipi_orario_wrapper.git
```

Run `flutter pub get` to install the dependencies.

## Usage

### Importing

```dart
import 'package:unipi_orario_wrapper/src/models/lesson.dart';
import 'package:unipi_orario_wrapper/src/service/wrapper_api_service.dart';
```

### Fetching Raw Lessons Data

The `fetchLessons` method retrieves a list of lessons as dynamic objects:

```dart
WrapperService wrapperService = WrapperService();

List<dynamic> lessons = await wrapperService.fetchLessons(
  calendarId: 'your_calendar_id',
  startDate: DateTime(2023, 09, 01),
  endDate: DateTime(2023, 09, 07),
);

print(lessons);
```

### Fetching Lessons as Objects

The `fetchLessonsObj` method retrieves lessons and converts them into `Lesson` objects:

```dart
WrapperService wrapperService = WrapperService();

List<Lesson> lessons = await wrapperService.fetchLessonsObj(
  calendarId: 'your_calendar_id',
  startDate: DateTime(2023, 09, 01),
  endDate: DateTime(2023, 09, 07),
);

for (var lesson in lessons) {
  print(lesson);
}
```

### Lesson Object Structure
[View the file](https://github.com/UniPi-Orari/api-wrapper/blob/master/lib/src/models/lesson.dart)