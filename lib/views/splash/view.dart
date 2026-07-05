import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:waheed/core/components/app_colors.dart';
import 'package:waheed/core/components/app_image.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FlipInY(
              duration: const Duration(milliseconds: 900),
              child: AppImage(image: 'logo_dark.png', height: 169.h, width: 162.w),
            ),
          ],
        ),
      ),
    );
  }
}
