import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckGivenWidgets
    extends Given3WithWorld<String, String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, String input2, String input3) async {
    final textinput1 = find.byValueKey(input1);
    final textinput2 = find.byValueKey(input2);
    final button = find.byValueKey(input3);
    await FlutterDriverUtils.isPresent(world.driver, textinput1);
    await FlutterDriverUtils.isPresent(world.driver, textinput2);
    await FlutterDriverUtils.isPresent(world.driver, button);
  }

  @override
  RegExp get pattern => RegExp(r"I have {string} and {string} and {string}");
}

class CheckGivenWidget
    extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input) async {
    final textinput = find.byValueKey(input);
    await FlutterDriverUtils.isPresent(world.driver, textinput);
  }

  @override
  RegExp get pattern => RegExp(r"I have {string}");
}

class ClickButton extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String btn) async {
    final btnfinder = find.byValueKey(btn);
    await FlutterDriverUtils.tap(world.driver, btnfinder);
  }

  @override
  RegExp get pattern => RegExp(r"I tap the {string} button");
}

class CheckIfPageIsPresent extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final pagefinder = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent(world.driver, pagefinder);
  }

  @override
  RegExp get pattern => RegExp(r"I should see the {string} screen");
}




