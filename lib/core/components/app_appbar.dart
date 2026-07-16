import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waheed/core/components/app_back.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? titleWidget; 
  final bool isCenter;
  final List<Widget>? actions;
  final Color? bgColor;
  final bool showBack;

  const AppAppBar({
    super.key,
    this.title = "",
    this.titleWidget,
    this.isCenter = true,
    this.actions,
    this.bgColor,
    this.showBack = true, 
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? Colors.white,
      elevation: 0,
      centerTitle: isCenter,
      automaticallyImplyLeading: false, 
      title: titleWidget ?? Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      leading: showBack ? const AppBack() : null, 
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}