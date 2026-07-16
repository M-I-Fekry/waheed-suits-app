import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppActionIcon extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  final bool hasNotificationDot; 
  final String? badgeCount; 

  const AppActionIcon({
    super.key,
    required this.icon,
    required this.onTap,
    this.hasNotificationDot = false,
    this.badgeCount,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50.r),
      child: Container(
        width: 48.w,
        height: 48.w, 
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xffEAEAEC), 
            width: 1,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset(
              icon,
              width: 24.w,
              height: 24.h,
              colorFilter: const ColorFilter.mode(
                Color(0xff000000),
                BlendMode.srcIn,
              ),
            ),
            if (hasNotificationDot)
              Positioned(
                top: 8.h,
                right: 10.w,
                child: Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: const BoxDecoration(
                    color: Color(0xffFF3B30),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            if (badgeCount != null && badgeCount!.isNotEmpty)
              Positioned(
                top: -4.h,
                left: -4.w,
                child: Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: const BoxDecoration(
                    color: Color(0xff000000),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    badgeCount!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}