import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waheed/core/components/app_button.dart';
import 'package:waheed/core/components/app_colors.dart';
import 'package:waheed/core/components/app_image.dart';
import 'package:waheed/core/components/app_input.dart';
import 'package:waheed/core/components/app_login_or_register.dart';
import 'package:waheed/core/components/social_login.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                padding: EdgeInsets.only(
                  top: 16.h,
                  bottom: 24.h,
                  left: 16.w,
                  right: 16.w,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'إنشاء حساب',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      const AppLoginOrRegister(isLogin: false),
                      SizedBox(height: 16.h),
                      const AppInput(
                        title: 'الاسم بالكامل',
                        hintText: 'اكتب اسمك الكامل',
                        prefixIcon: 'profile.svg',
                        bottomSpace: 12,
                      ),
                      const AppInput(
                        title: 'رقم الهاتف',
                        hintText: ' 102233558  20+ ',
                        prefixIcon: 'call.svg',
                        keyboardType: TextInputType.phone,
                        bottomSpace: 12,
                        textAlign: TextAlign.left,
                      ),
                      const AppInput(
                        title: 'البريد الإلكتروني',
                        hintText: 'Name@example.com',
                        prefixIcon: 'email.svg',
                        keyboardType: TextInputType.emailAddress,
                        bottomSpace: 12,
                      ),
                      const AppInput(
                        title: 'كلمة المرور',
                        hintText: '........',
                        isPassword: true,
                        bottomSpace: 12,
                      ),
                      const AppInput(
                        title: 'تأكيد كلمة المرور',
                        hintText: '........',
                        isPassword: true,
                        bottomSpace: 20,
                      ),
                      AppButton(text: 'إنشاء حساب', onPressed: () {}),
                      SizedBox(height: 16.h),
                      const SocialLogin(),
                      SizedBox(height: 8.h),
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
