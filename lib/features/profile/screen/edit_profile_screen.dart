import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/global_widget/custom_appbar.dart';
import '../../../core/global_widget/custom_drop_down.dart';
import '../../../core/global_widget/custom_elevated_button.dart';
import '../../../core/global_widget/custom_text_fields.dart';
import '../../../core/global_widget/custom_text_view.dart';
import '../../../core/utility/app_colors.dart';
import '../../../core/validation/email_validation.dart';
import '../../../core/validation/name_validator.dart';
import '../controller/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final EditProfileController controller = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Edit Profile'),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(() {
          return CustomElevatedButton(
            ontap: () {
              Get.back();
              // if (formKey.currentState!.validate()) {
              //   controller.updateProfile();
              // }
            },
            isLoading: controller.isLoading.value,
            text: 'Update',
          );
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: RefreshIndicator(
          backgroundColor: AppColors.primaryColor,
          color: Colors.black,
          onRefresh: () {
            return Future.delayed(Duration(seconds: 2));
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextView(
                  'Full name',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: "Enter Full Name",
                  controller: controller.nameController,
                  keyboardType: TextInputType.text,
                  validator: validateName,
                ),

                SizedBox(height: 10.h),

                CustomTextView(
                  'Email',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  hintText: "Enter your email",
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  // hintText:
                  // controller.profileController.email.value == ""
                  //     ? "Enter Email"
                  //     : controller.profileController.email.value,
                  // isReadonly: controller.profileController.email.value != "",
                  validator: validateEmail,
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
