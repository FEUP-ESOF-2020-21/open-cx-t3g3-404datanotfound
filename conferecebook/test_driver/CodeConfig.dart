import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/test_steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/CodeTest.feature")]
    ..reporters = [ProgressReporter()]
    ..stepDefinitions = [
      CheckGivenWidgetCode(),
      ClickButton(),
      CheckIfPageIsPresent(),
      ClickButton2(),
      CheckIfPageIsPresent(),
    ]
    ..targetAppPath = "test_driver/CodeApp.dart"
    ..exitAfterTestRun = true;

  return GherkinRunner().execute(config);
}