import 'package:flutter/material.dart';
import 'package:gojek_duplicate/app/core/utils.dart';

enum ButtonTemplateType { primary, secondary }

class ButtonTemplate extends StatelessWidget {
  final String label;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final ButtonTemplateType type;
  final Function() onTap;
  const ButtonTemplate(
      {required this.label,
      required this.type,
      required this.onTap,
      this.width,
      this.padding,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(width ?? 100, 40),
              backgroundColor: type == ButtonTemplateType.primary
                  ? AtomColors.green1
                  : Colors.white,
              textStyle: AtomTextStyle.sansBold,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                      color: type == ButtonTemplateType.secondary
                          ? AtomColors.green1
                          : Colors.transparent))),
          onPressed: onTap,
          child: Text(label,
              style: AtomTextStyle.sansBold.copyWith(
                  color: type == ButtonTemplateType.primary
                      ? Colors.white
                      : AtomColors.green1))),
    );
  }
}
