import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:waheed/core/components/app_colors.dart';

class AppOTP extends StatelessWidget {
  const AppOTP({super.key, this.pinController});

  final PinInputController? pinController;

  @override
  Widget build(BuildContext context) {
    // ⬇️ الحل النهائي: قفلنا عليها العرض بالمللي وسنترناها غصب عنها
    return Center(
      child: SizedBox(
        width: 280.w, // العرض المحسوب بالظبط للمربعات والمسافات
        child: Directionality(
          textDirection: TextDirection.ltr, // عشان الأرقام تتكتب معدولة
          child: MaterialPinField(
            pinController: pinController,
            length: 6,
            mainAxisAlignment: MainAxisAlignment.center,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            theme: MaterialPinTheme(
              shape: MaterialPinShape.outlined,
              cellSize: Size(43.w, 48.h),
              borderRadius: BorderRadius.circular(8.r),
              spacing: 4.w,
              borderColor: const Color(0xff9EA1A8),
              focusedBorderColor: AppColors.primary,
              filledBorderColor: AppColors.primary,
              fillColor: Colors.transparent,
              focusedFillColor: Colors.transparent,
              filledFillColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
