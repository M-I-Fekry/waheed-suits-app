import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waheed/core/components/app_image.dart'; 

class AppCategoryCard extends StatelessWidget {
  final String title;
  final String icon; 
  final VoidCallback onTap;

  const AppCategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xffEAEAEC)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppImage(image: icon, width: 42.w, height: 42.h),
            SizedBox(width: 12.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
