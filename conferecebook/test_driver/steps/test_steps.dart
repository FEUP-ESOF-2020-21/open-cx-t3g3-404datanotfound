import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckGivenWidgetLogin
    extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String screen) async {
    sleep(Duration(seconds:10));
    final check = find.byValueKey(screen);
    await FlutterDriverUtils.isPresent(world.driver, check);
  }

  @override
  RegExp get pattern => RegExp(r"I'm in the {string} screen");
}

class CheckGivenWidgetPost
    extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input) async {
    sleep(Duration(seconds:10));
    final textinput = find.byValueKey(input);
    await FlutterDriverUtils.isPresent(world.driver, textinput);
  }

  @override
  RegExp get pattern => RegExp(r"I'm the user test@gherkin.com, I'm logged in, I'm as a participant at WebSummit2020 and I see the {string} screen");
}

class CheckGivenWidgetCode
    extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String screen) async {
    sleep(Duration(seconds:10));
    final check = find.byValueKey(screen);
    await FlutterDriverUtils.isPresent(world.driver, check);
  }

  @override
  RegExp get pattern => RegExp(r"I'm the user test@gherkin.com, I'm logged in and I see the {string} screen");
}

class ClickButton extends When1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String btn) async {
    final btnfinder = find.byValueKey(btn);
    await FlutterDriverUtils.tap(world.driver, btnfinder);
  }

  @override
  RegExp get pattern => RegExp(r"I tap the {string} button");
}

class ClickButton2 extends And1WithWorld<String, FlutterWorld> {
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
  RegExp get pattern => RegExp(r"I see the {string} screen");
}