import 'package:flutter/material.dart';
import 'package:mvm_solid_provider/res/app_colors.dart';
import 'package:mvm_solid_provider/res/components/simple_text.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final bool isLoading;
  final VoidCallback onPress;
  const RoundButton({
    Key? key,
    required this.text,
    this.bgColor = AppColors.buttonColor,
    this.isLoading = false,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : SimpleText(text: text)),
      ),
    );
  }
}
