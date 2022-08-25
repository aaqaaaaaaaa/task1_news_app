import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget.rectangle(
      {Key? key,
      this.shapeBorder = const RoundedRectangleBorder(),
      required this.width,
      required this.height,
      required this.color,
      this.outlined = false,
      this.child})
      : super(key: key);

  const ShimmerWidget.outlined(
      {Key? key,
      this.shapeBorder = const RoundedRectangleBorder(),
      required this.width,
      required this.height,
      required this.color,
      this.outlined = true,
      this.child})
      : super(key: key);
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  final Color color;
  final bool outlined;
  final Widget? child;

  const ShimmerWidget.circular({
    Key? key,
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
    required this.color,
    this.child,
    this.outlined = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.deepPurple,
      child: Container(
        width: width,
        height: height,
        decoration: outlined
            ? BoxDecoration(border: Border.all(color: Colors.white24, width:  2))
            : ShapeDecoration(
                shape: shapeBorder,
                color: color,
              ),
        child: child ?? Container(),
      ),
    );
  }
}
