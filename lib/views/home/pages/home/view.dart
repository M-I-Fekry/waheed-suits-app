import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waheed/core/components/app_action_icon.dart';
import 'package:waheed/core/components/app_appbar.dart';
import 'package:waheed/core/components/app_colors.dart';
import 'package:waheed/core/components/app_image.dart';
import 'package:waheed/core/components/app_search.dart';
import 'package:waheed/views/home/pages/home/components/home_banner.dart';
import 'package:waheed/views/home/pages/home/components/home_categories.dart';
import 'package:waheed/views/home/pages/home/components/home_latest_products.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.lightGrey,
        appBar: AppAppBar(
          showBack: false,
          isCenter: false,
          titleWidget: AppActionIcon(
            icon: 'assets/icons/notification.svg',
            hasNotificationDot: true,
            onTap: () {},
          ),
          actions: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: AppImage(image: 'logo.png', height: 32.h, width: 144.w),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppSearch(
                onFilterTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                    ),
                    builder: (context) {
                      return Container(
                        width: double.infinity,
                        height: 400.h,
                        padding: EdgeInsets.all(20.r),
                        child: Column(
                          children: [
                            Text(
                              "تصفية المنتجات",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 26.h),
              HomeBanner(),
              HomeCategories(),
              HomeLatestProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
