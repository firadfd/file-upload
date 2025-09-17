import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/global_widget/custom_elevated_button.dart';
import '../../../core/global_widget/custom_text_view.dart';
import '../../../core/route/app_route.dart';
import '../../../core/utility/app_colors.dart';
import '../../../core/utility/imagePath.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImagePath.success, width: 100.w, height: 100.h),
              SizedBox(height: 5.h),
              CustomTextView(
                "Password Changed!",
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF2D2D2D),
              ),
              SizedBox(height: 10.h),
              CustomTextView(
                "Your password has been changed successfully.",
                fontSize: 14.sp,
                color: AppColors.textColor,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 20.h),
              CustomElevatedButton(
                ontap: () {
                  Get.offAllNamed(AppRoute.signIn);
                },
                text: "Back to Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
