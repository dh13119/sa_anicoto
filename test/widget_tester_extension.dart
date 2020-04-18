import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supercharged/supercharged.dart';

extension WidgetTesterExtension on WidgetTester {
  void addAnimationWidget(Widget widget) async {
    await pumpWidget(widget);
    await pump(100.milliseconds);
  }

  void wait(Duration duration) async {
    await pump(duration);
    await pump(100.milliseconds);
  }
}
