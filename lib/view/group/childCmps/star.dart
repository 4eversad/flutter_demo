import 'package:flutter/material.dart';

class StarWidget extends StatefulWidget {
  /// 星星数量
  final int starCount;

  /// 星星大小
  final double starSize;

  /// 分数
  final double rate;

  /// 最大分值
  final double maxRate;
  const StarWidget(
      {super.key,
      this.starCount = 5,
      this.starSize = 30.0,
      this.rate = 0,
      this.maxRate = 5});
  @override
  State<StarWidget> createState() => _StarWidgetState();
}

class _StarWidgetState extends State<StarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: generateStars(
            count: widget.starCount,
            starSize: widget.starSize,
            rate: widget.rate,
            maxRate: widget.maxRate));
  }
}

List<Widget> generateStars(
    {required int count,
    required double starSize,
    required double rate,
    required double maxRate}) {
  var list = <Widget>[];

  /// 每个星星代表的分数
  var starRate = maxRate / count;
  // 得到评分的星星
  var activeStar = (rate / starRate).floor();
  var notActiveStar = count - (rate / starRate).ceil();
  var extraRate = (rate - starRate * activeStar) / starRate;
  for (var i = 0; i < activeStar; i++) {
    list.add(Icon(
      Icons.star,
      size: starSize,
      color: const Color.fromARGB(189, 251, 140, 3),
    ));
  }
  if (extraRate > 0) {
    final double width = starSize * extraRate;
    list.add(Stack(
      alignment: Alignment.centerLeft,
      children: [
        Positioned(
          child: ClipRect(
              clipper: MyRectClipper(
                starSize,
                width: width,
                type: 'notActive',
              ),
              child: Icon(
                Icons.star,
                size: starSize,
                color: const Color.fromARGB(188, 151, 142, 130),
              )),
        ),
        Positioned(
          child: ClipRect(
              clipper: MyRectClipper(starSize, width: width),
              child: Icon(
                Icons.star,
                size: starSize,
                color: const Color.fromARGB(189, 251, 140, 3),
              )),
        )
      ],
    ));
  }

  for (var i = 0; i < notActiveStar; i++) {
    list.add(Icon(
      Icons.star,
      size: starSize,
      color: const Color.fromARGB(188, 151, 142, 130),
    ));
  }
  return list;
}

class MyRectClipper extends CustomClipper<Rect> {
  final double size;
  final double width;
  final String type;
  MyRectClipper(
    this.size, {
    this.width = 10,
    this.type = 'active',
  });

  @override
  Rect getClip(Size size) {
    if (type == 'active') {
      return Rect.fromLTRB(0, 0, width, this.size);
    } else {
      return Rect.fromLTRB(width, size.height, size.width, 0);
    }
  }

  @override
  bool shouldReclip(MyRectClipper oldClipper) {
    return true;
  }
}
