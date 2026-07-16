import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waheed/core/components/app_image.dart';

class AppSearch extends StatelessWidget {
  final String hintText;
  final VoidCallback? onFilterTap;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool hasFilter;

  const AppSearch({
    super.key,
    this.hintText = "البحث عن منتج...",
    this.onFilterTap,
    this.controller,
    this.onChanged,
    this.hasFilter = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(
            color: const Color(0xff9EA1A8),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Color(0xffEAEAEC)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Color(0xffEAEAEC)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Color(0xff000000)),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.all(12.r),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              colorFilter: const ColorFilter.mode(
                Color(0xff9EA1A8),
                BlendMode.srcIn,
              ),
            ),
          ),
          suffixIcon: hasFilter
              ? GestureDetector(
                  onTap: onFilterTap,
                  child: Padding(
                    padding: EdgeInsets.all(12.r),
                    child: AppImage(image: 'filter.svg'),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
