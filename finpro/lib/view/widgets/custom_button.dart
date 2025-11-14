import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isLoading;
  final bool filled; // true = Primary Button, false = Outline Button
  final bool fullWidth;
  final double height;
  final double borderRadius;
  final Color? color;
  final Color? textColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.isLoading = false,
    this.filled = true,
    this.fullWidth = true,
    this.height = 48,
    this.borderRadius = 10,
    this.color,
    this.textColor,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? const Color(0xFF1449FF); // primary brand color
    final btnTextColor = textColor ?? (filled ? Colors.white : buttonColor);

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: height,
      child: ElevatedButton(
        onPressed: (isLoading || onTap == null) ? null : onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: filled ? buttonColor : Colors.transparent,
          foregroundColor: btnTextColor,
          side: filled ? null : BorderSide(color: buttonColor, width: 1.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: isLoading
            ? const SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) ...[
              prefixIcon!,
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: btnTextColor),
            ),
            if (suffixIcon != null) ...[
              const SizedBox(width: 8),
              suffixIcon!,
            ],
          ],
        ),
      ),
    );
  }
}
