import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waheed/core/components/app_colors.dart';
import 'package:waheed/core/components/app_image.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.buttonColor,
    this.textColor,
    this.isLoading = false,
    this.isOutlined = false, 
    this.borderColor,     
  });

  final VoidCallback? onPressed;
  final String? icon;
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final bool isLoading;
  final bool isOutlined;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    Widget buttonContent = isLoading
        ? CupertinoActivityIndicator(
            color: textColor ?? (isOutlined ? Colors.black : AppColors.background),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                AppImage(image: icon!, width: 24.w, height: 24.h),
                SizedBox(width: 8.w),
              ],
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: textColor ?? (isOutlined ? Colors.black : AppColors.background),
                ),
              ),
            ],
          );

    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: isOutlined
          ? OutlinedButton(
              onPressed: isLoading ? null : (onPressed ?? () {}),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: borderColor ?? Colors.black, 
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: buttonContent,
            )
          : ElevatedButton(
              onPressed: isLoading ? null : (onPressed ?? () {}),
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor ?? AppColors.primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: buttonContent,
            ),
    );
  }
}