import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final Function() onPress;
  final String icon;
  final Color? iconBg;
  final String label;
  final Color bgColor;
  final Color? labelColor;
  final BorderSide side;
  const SocialButton({
    Key? key,
    required this.onPress,
    required this.icon,
    required this.label,
    required this.bgColor,
    this.labelColor = Colors.white,
    this.side = BorderSide.none,
    this.iconBg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25), side: side),
        ),
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: iconBg ?? Colors.transparent,
                radius: 15,
                backgroundImage: AssetImage(
                  icon,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: TextStyle(color: labelColor),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
