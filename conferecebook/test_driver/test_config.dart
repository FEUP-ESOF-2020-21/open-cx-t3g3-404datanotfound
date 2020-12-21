import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/test_steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [ProgressReporter()]
    ..stepDefinitions = [
      //Login
      CheckGivenWidgets(),
      ClickButton(),
      CheckIfPageIsPresent(),
      //Event
      CheckGivenWidget(),
      ClickButton(),
      CheckIfPageIsPresent(),
      ClickButton(),
      CheckIfPageIsPresent(),
      //Post
      CheckGivenWidget(),
      ClickButton(),
      CheckIfPageIsPresent(),
      ClickButton(),
      CheckIfPageIsPresent()
    ]
    ..restartAppBetweenScenarios = false
    ..targetAppPath = "test_driver/app.dart"
    ..order = ExecutionOrder.sequential
    ..exitAfterTestRun = true;

  return GherkinRunner().execute(config);
}