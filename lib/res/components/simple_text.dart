import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/res/app_colors.dart';

class SimpleText extends StatelessWidget {
  final String text;

  final double? txtSize;
  final FontWeight? fontWeight;
  const SimpleText({
    Key? key,
    required this.text,
    this.txtSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: txtSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
