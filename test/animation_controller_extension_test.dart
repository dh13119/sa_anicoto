import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sa_anicoto/sa_anicoto.dart';
import 'package:supercharged/supercharged.dart';

import './widget_tester_extension.dart';

void main() {
  testWidgets("AnimationControllerExtension", (WidgetTester tester) async {
    var values = <int>[];
    var animation = MaterialApp(home: TestWidget((value) => values.add(value)));

    await tester.addAnimationWidget(animation);

    for (var i = 0; i < 200; i++) {
      await tester.wait(1.days);
    }

    expect(values, expectedValues);
  });
}

class TestWidget extends StatefulWidget {
  final Function(int value) exposeValue;

  TestWidget(this.exposeValue);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> with AnimationMixin {
  Animation<int> a;

  @override
  void initState() {
    a = 0.tweenTo(10).animatedBy(controller);
    play();
    super.initState();
  }

  void play() async {
    await controller.play(duration: 10.days);
    await controller.playReverse(duration: 10.days);

    controller.loop(duration: 10.days);
    await Future.delayed(20.days);

    controller.mirror(duration: 10.days);
    await Future.delayed(20.days);

    controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    widget.exposeValue(a.value);
    return Container(
      child: Text("${a.value}"),
    );
  }
}

const expectedValues = <int>[
  0,
  0,
  1,
  1,
  2,
  2,
  3,
  3,
  4,
  4,
  5,
  5,
  6,
  6,
  7,
  7,
  8,
  8,
  9,
  9,
  10,
  10,
  9,
  9,
  8,
  8,
  7,
  7,
  6,
  6,
  5,
  5,
  4,
  4,
  3,
  3,
  2,
  2,
  1,
  1,
  0,
  0,
  1,
  1,
  2,
  2,
  3,
  3,
  4,
  4,
  5,
  5,
  6,
  6,
  7,
  7,
  8,
  8,
  9,
  9,
  0,
  0,
  1,
  1,
  2,
  2,
  3,
  3,
  4,
  4,
  5,
  5,
  6,
  6,
  7,
  7,
  8,
  8,
  9,
  9,
  9,
  9,
  10,
  10,
  9,
  9,
  8,
  8,
  7,
  7,
  6,
  6,
  5,
  5,
  4,
  4,
  3,
  3,
  2,
  2,
  1,
  1,
  0,
  0,
  1,
  1,
  2,
  2,
  3,
  3,
  4,
  4,
  5,
  5,
  6,
  6,
  7,
  7,
  8,
  8
];
