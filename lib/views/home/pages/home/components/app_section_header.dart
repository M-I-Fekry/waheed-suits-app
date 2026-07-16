import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waheed/core/components/app_colors.dart';

class AppSectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAllTap;

  const AppSectionHeader({
    super.key,
    required this.title,
    required this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          InkWell(
            onTap: onSeeAllTap,
            borderRadius: BorderRadius.circular(4.r),
            child: Text(
              "عرض الكل",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.greyText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
