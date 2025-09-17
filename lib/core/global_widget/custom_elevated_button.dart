import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utility/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final VoidCallback ontap;
  final bool isLoading;
  final double? widths;

  const CustomElevatedButton({
    super.key,
    this.widths = 0,
    required this.ontap,
    required this.text,
    this.backgroundColor,
    this.textStyle,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveColor = backgroundColor ?? AppColors.primaryColor;

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (states) => effectiveColor,
        ),
        minimumSize: WidgetStateProperty.all<Size>(
          Size(widths == 0 ? double.infinity : widths!, 50),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
      onPressed: isLoading ? null : ontap,
      child: isLoading
          ? SizedBox(
        height: 24.h,
        width: 24.h,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2.5,
        ),
      )
          : Text(
        text,
        textAlign: TextAlign.center,
        style: textStyle ?? GoogleFonts.andika(
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
