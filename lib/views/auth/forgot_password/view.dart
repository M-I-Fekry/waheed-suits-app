import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waheed/core/components/app_appbar.dart';
import 'package:waheed/core/components/app_button.dart';
import 'package:waheed/core/components/app_colors.dart';
import 'package:waheed/core/components/app_input.dart';
import 'package:waheed/core/components/app_otp.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late final list = [
    _model(
      title: "نسيت كلمة المرور؟",
      desc: "أدخل بريدك الإلكتروني لإرسال رمز تحقق اّمن.",
      btnText: "إرسال رابط",
      btnColor: Colors.black.withOpacity(0.6),
      alignment: CrossAxisAlignment.start,
      textAlign: TextAlign.start,
      formWidget: const AppInput(
        title: 'البريد الإلكتروني',
        hintText: 'Name@example.com',
        prefixIcon: 'email.svg',
        keyboardType: TextInputType.emailAddress,
        bottomSpace: 40,
      ),
    ),
    _model(
      title: "رمز التحقق",
      desc: "تم إرسال الرمز إلي Name@example.com",
      btnText: "تحقق ومتابعه",
      btnColor: Colors.black.withOpacity(0.6),
      alignment: CrossAxisAlignment.start,
      textAlign: TextAlign.center,
      formWidget: Padding(
        padding: EdgeInsets.only(bottom: 71.h),
        child: AppOTP(),
      ),
    ),
    _model(
      btnText: "تأكيد كلمة المرور الجديدة",
      btnColor: Colors.black,
      alignment: CrossAxisAlignment.start,
      textAlign: TextAlign.start,
      formWidget: Column(
        children: [
          const AppInput(
            title: 'كلمة المرور',
            hintText: '........',
            isPassword: true,
            bottomSpace: 16,
          ),
          const AppInput(
            title: 'كلمة المرور',
            hintText: '........',
            isPassword: true,
            bottomSpace: 40,
          ),
        ],
      ),
    ),
  ];

  int currentIndex = 0;

  void _nextStep() {
    if (currentIndex < list.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        appBar: AppAppBar(title: 'نسيت كلمة المرور'),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Center(
                  child: Text(
                    'خطوة ${currentIndex + 1} / 3',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyText,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),

              Row(
                children: [
                  _buildProgressLine(isActive: currentIndex >= 0),
                  SizedBox(width: 8.w),
                  _buildProgressLine(isActive: currentIndex >= 1),
                  SizedBox(width: 8.w),
                  _buildProgressLine(isActive: currentIndex >= 2),
                ],
              ),
              SizedBox(height: 32.h),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: list[currentIndex].alignment,
                  children: [
                    if (list[currentIndex].title != null) ...[
                      Text(
                        list[currentIndex].title!,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: list[currentIndex].textAlign,
                      ),
                      SizedBox(height: 12.h),
                    ],
                    if (list[currentIndex].desc != null) ...[
                      Text(
                        list[currentIndex].desc!,
                        style: TextStyle(fontSize: 14.sp, height: 1.5),
                        textAlign: list[currentIndex].textAlign,
                      ),
                      SizedBox(height: 40.h),
                    ],
                    list[currentIndex].formWidget,
                    AppButton(
                      text: list[currentIndex].btnText,
                      buttonColor: list[currentIndex].btnColor,
                      textColor: Colors.white,
                      onPressed: _nextStep,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressLine({required bool isActive}) {
    return Expanded(
      child: Container(
        height: 6.h,
        decoration: BoxDecoration(
          color: isActive ? Colors.black : const Color(0xffE5E7EB),
          borderRadius: BorderRadius.circular(2.r),
        ),
      ),
    );
  }
}

class _model {
  final String? title, desc;
  final String btnText;
  final Color btnColor;
  final Widget formWidget;
  final CrossAxisAlignment alignment;
  final TextAlign textAlign;

  _model({
    this.title,
    this.desc,
    required this.btnText,
    required this.btnColor,
    required this.formWidget,
    this.alignment = CrossAxisAlignment.start,
    this.textAlign = TextAlign.start,
  });
}
