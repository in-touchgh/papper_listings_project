import 'package:flutter/material.dart';
import 'package:paperless_listings/Utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Function() onPress;
  final Widget child;
  final Color? bgColor;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  const CustomButton({
    Key? key,
    required this.onPress,
    required this.child,
    this.bgColor,
    this.width,
    this.height,
    this.borderRadius,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: padding,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(25),
            ),
            backgroundColor: bgColor ?? AppColors.defaultRed),
        onPressed: onPress,
        child: Center(child: child),
      ),
    );
  }
}
