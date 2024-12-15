import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget {
  final Axis axis;
  final double? height;
  final double dashWidth;
  final double dashHeight;
  final Color color;
  final int count;
  const LineWidget(this.axis,
      {this.dashWidth = 1,
      this.dashHeight = 1,
      this.count = 5,
      this.height,
      this.color = Colors.pink,
      super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        height: height,
        child: Flex(
            direction: axis,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(count, (int index) {
              return SizedBox(
                width: axis == Axis.horizontal ? dashWidth : 1,
                height: axis == Axis.vertical ? dashHeight : 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            })),
      );
    });
  }
}
