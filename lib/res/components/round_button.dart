import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/res/app_colors.dart';
import 'package:mvm_solid_provider/res/components/simple_text.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color? txtColor;
  final bool isLoading;
  final VoidCallback onPress;
  const RoundButton({
    Key? key,
    required this.text,
    this.bgColor = AppColors.buttonColor,
    this.txtColor,
    this.isLoading = false,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: isLoading
          ? const CircularProgressIndicator()
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              height: 40,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: SimpleText(
                  text: text,
                  txtColor: txtColor ?? AppColors.whiteColor,
                ),
              )),
    );
  }
}
