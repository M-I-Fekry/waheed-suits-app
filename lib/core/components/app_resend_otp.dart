import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppResendOTP extends StatefulWidget {
  const AppResendOTP({super.key, this.onResend});
  final VoidCallback? onResend;

  @override
  State<AppResendOTP> createState() => _AppResendOTPState();
}

class _AppResendOTPState extends State<AppResendOTP> {
  bool isSent = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "لم تستلم الرمز ؟",
          style: TextStyle(
            color: const Color(0xff000000),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8.h),
        isSent
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "إعادة الإرسال خلال",
                    style: TextStyle(
                      color: const Color(0xff000000),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: CircularCountDownTimer(
                      width: 42,
                      height: 42,
                      duration: 30,
                      textFormat: CountdownTextFormat.MM_SS,
                      isReverse: true,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000),
                        fontSize: 14.sp,
                      ),
                      fillColor: Colors.transparent,
                      ringColor: Colors.transparent,
                      onComplete: () {
                        if (mounted) {
                          setState(() {
                            isSent = false;
                          });
                        }
                      },
                    ),
                  ),
                ],
              )
            : TextButton.icon(
                onPressed: () {
                  if (widget.onResend != null) {
                    widget.onResend!();
                  }
                  setState(() {
                    isSent = true;
                  });
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: Icon(
                  Icons.refresh,
                  color: const Color(0xff000000),
                  size: 16.r,
                ),
                label: Text(
                  "إعادة الإرسال",
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
      ],
    );
  }
}