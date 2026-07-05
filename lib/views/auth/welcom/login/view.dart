import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waheed/core/components/app_button.dart';
import 'package:waheed/core/components/app_colors.dart';
import 'package:waheed/core/components/app_image.dart';
import 'package:waheed/core/components/app_input.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AppImage(image: 'auth_bg.jpg', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ليس لديك حساب ؟ ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'إنشاء حساب جديد',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.greyText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  AppInput(
                    title: 'البريد الإلكتروني',
                    hintText: 'Name@example.com',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: 'email.svg',
                  ),
                  AppInput(
                    title: 'كلمة المرور',
                    hintText: 'كلمة المرور',
                    isPassword: true,
                    bottomSpace: 8.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'هل نسيت كلمة المرور ؟',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.greyText,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  AppButton(text: 'تسجيل الدخول', onPressed: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
