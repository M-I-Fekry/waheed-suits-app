import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waheed/core/components/app_appbar.dart';
import 'package:waheed/core/components/app_button.dart';
import 'package:waheed/core/components/app_otp.dart';
import 'package:waheed/core/components/app_resend_otp.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: ""),
      body: Column(
        children: [
          SizedBox(height: 32.h),
          Text(
            "تأكيد البريد الإلكتروني",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              height: 1.9,
            ),
          ),
          Text(
            "أدخل رمز التحقق المرسل إلي\nFekry@gmail.com",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, height: 1.5),
          ),
          SizedBox(height: 32.h),
          const AppOTP(),
          SizedBox(height: 56.h),
          AppResendOTP(onResend: () {}),
          SizedBox(height: 57.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppButton(
              text: "تحقق",
              onPressed: () {},
              buttonColor: Colors.black.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
