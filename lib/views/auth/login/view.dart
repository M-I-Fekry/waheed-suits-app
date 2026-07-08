import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waheed/core/components/app_button.dart';
import 'package:waheed/core/components/app_colors.dart';
import 'package:waheed/core/components/app_image.dart';
import 'package:waheed/core/components/app_input.dart';
import 'package:waheed/core/components/app_login_or_register.dart';
import 'package:waheed/core/components/social_login.dart';
import 'package:waheed/core/logic/helper_methods.dart';
import 'package:waheed/views/auth/register/view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 42.h),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.r),
                  ),
                ),
                child: SingleChildScrollView(
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
                      AppLoginOrRegister(),
                      SizedBox(height: 16.h),
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
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'هل نسيت كلمة المرور ؟',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      AppButton(text: 'تسجيل الدخول', onPressed: () {}),
                      SizedBox(height: 16.h),
                      SocialLogin(),
                      SizedBox(height: 7.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
