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

  const AppInput({
    super.key,
    required this.title,
    this.suffixIcon,
    this.prefixIcon,
    this.onPressed,
    this.keyboardType,
    this.isPassword = false,
    this.bottomSpace = 16,
    this.controller,
    this.onCountryCodeChanged,
    this.validator,
    this.hintText,
    this.maximumLines = 1,
    this.isrReadOnly = false,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomSpace ?? 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.h),
          TextFormField(
            readOnly: widget.isrReadOnly,
            maxLines: widget.maximumLines,
            controller: widget.controller,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword && isHidden,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              counterText: "",
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.circular(16.r),
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: Color(0xff939393),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        isHidden
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isHidden = !isHidden;
                        });
                      },
                    )
                  : widget.suffixIcon != null
                  ? Padding(
                      padding: EdgeInsets.all(16.r),
                      child: AppImage(
                        image: widget.suffixIcon!,
                        color: Colors.grey,
                        width: 18.w,
                        height: 18.h,
                      ),
                    )
                  : null,
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.all(12.r),
                      child: AppImage(
                        image: widget.prefixIcon!,
                        width: 24,
                        height: 24,
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
