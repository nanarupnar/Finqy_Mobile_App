import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool showBack;
  final VoidCallback? onBack;
  final Color backgroundColor;
  final Color titleColor;
  final double elevation;
  final Widget? leading;
  final List<Widget>? actions;

  const CommonAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.showBack = true,
    this.onBack,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
    this.elevation = 0,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false, // So we control the back button
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
      ),
      leading: leading ??
          (showBack
              ? IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 18),
            color: titleColor,
            onPressed: onBack ?? () => Navigator.pop(context),
          )
              : null),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: titleColor,
          fontWeight: FontWeight.w600,
        ),
      ),

      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
