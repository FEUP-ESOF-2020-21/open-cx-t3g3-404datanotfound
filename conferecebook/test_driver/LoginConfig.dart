import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/test_steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/LoginTest.feature")]
    ..reporters = [ProgressReporter()]
    ..stepDefinitions = [
      CheckGivenWidgetLogin(),
      ClickButton2(),
      CheckIfPageIsPresent(),
    ]
    ..targetAppPath = "test_driver/LoginApp.dart"
    ..exitAfterTestRun = true;

  return GherkinRunner().execute(config);
}