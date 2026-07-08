import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'app_image.dart';

class AppInput extends StatefulWidget {
  final TextInputType? keyboardType;
  final bool isPassword;
  final VoidCallback? onPressed;
  final String? suffixIcon, prefixIcon;
  final double? bottomSpace;
  final TextEditingController? controller;
  final ValueChanged<String>? onCountryCodeChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final String title;
  final int maximumLines;
  final bool isrReadOnly;
  final Widget? customLeftWidget;
  final TextAlign? textAlign;

  const AppInput({
    super.key,
    required this.title,
    this.suffixIcon,
    this.prefixIcon,
    this.onPressed,
    this.keyboardType,
    this.isPassword = false,
    this.bottomSpace,
    this.controller,
    this.onCountryCodeChanged,
    this.validator,
    this.hintText,
    this.maximumLines = 1,
    this.isrReadOnly = false,
    this.customLeftWidget,
    this.textAlign,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomSpace ?? 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 6.h),
          TextFormField(
            textAlign: widget.textAlign ?? TextAlign.start,
            readOnly: widget.isrReadOnly,
            maxLines: widget.maximumLines,
            controller: widget.controller,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword && isHidden,
            style: TextStyle(fontSize: 13.sp),
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              counterText: "",
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.circular(12.r),
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: const Color(0xff939393),
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 36.w,
                minHeight: 36.h,
              ),
              suffixIconConstraints: BoxConstraints(
                minWidth: 36.w,
                minHeight: 36.h,
              ),

              suffixIcon:
                  widget.customLeftWidget ??
                  (widget.isPassword
                      ? IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            isHidden
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey,
                            size: 20.r,
                          ),
                          onPressed: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },
                        )
                      : widget.suffixIcon != null
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: AppImage(
                            image: widget.suffixIcon!,
                            color: Colors.grey,
                            width: 18.w,
                            height: 18.h,
                          ),
                        )
                      : null),
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: AppImage(
                        image: widget.prefixIcon!,
                        width: 18.w,
                        height: 18.h,
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
