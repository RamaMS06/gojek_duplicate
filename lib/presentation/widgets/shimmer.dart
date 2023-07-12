import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTemplate extends StatelessWidget {
  final double? width, height, radius;
  final EdgeInsetsGeometry? padding;
  const ShimmerTemplate(
      {this.width, this.height, this.radius, this.padding, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radius ?? 15)),
          )),
    );
  }
}
