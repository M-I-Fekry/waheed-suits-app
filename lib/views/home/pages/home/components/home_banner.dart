import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int activeIndex = 0;

  final List<String> bannerImages = [
    'https://static.arrajol.com/styles/693x433/public/2021-03/1_16.jpg',
    'https://cdn.youcan.shop/stores/2128355c311606c085bc4e568f72b5b9/others/qFqJSoqXTkGzA4mjyO4vsyq1JnaI7Dk5gXANqBCq.png',
    'https://static.arrajol.com/styles/800x533_webp/public/2021-07/1_27.jpg.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: bannerImages.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              width: 370.w,
              // height: 220.h,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.grey[300],
                image: DecorationImage(
                  image: NetworkImage(bannerImages[index]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 220.h,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),

        SizedBox(height: 12.h),

        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: bannerImages.length,
          effect: WormEffect(
            dotWidth: 8.w,
            dotHeight: 8.h,
            activeDotColor: Colors.black,
            dotColor: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}
