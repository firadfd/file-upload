import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/global_widget/image_picker_controller.dart';
import '../../../core/helper/shared_prefarenses_helper.dart';
import '../../../core/service_class/network_caller/repository/network_caller.dart';
import '../../../core/utility/app_colors.dart';
import '../../../core/utility/app_urls.dart';
import '../../home/controller/home_controller.dart';

class ProfileController extends GetxController {
  SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();
  final HomeController homeController = Get.find();
  final imagePickerController = Get.put(ImagePickerController());
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await sharedPreferencesHelper.init();
  }

  Future<void> updateProfilePicture() async {
    var token = sharedPreferencesHelper.getString("userToken");

    if (token != null) {
      try {
        isLoading.value = true;
        String url = AppUrls.setProfilePic;
        Map<String, dynamic> body = {};
        final response = await NetworkCaller().putImage(
          "PATCH",
          url,
          body,
          imagePickerController.selectedImage.value!,
          token: token,
          imageName: "profileImage",
        );

        if (response['success'] == true) {
          Get.snackbar(
            "Success",
            "User Image update successfully",
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP,
          );
        } else {
          Get.snackbar(
            "Error",
            "Failed to update User Image",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
          );
        }
      } catch (e) {
        debugPrint("Error: $e");
      } finally {
        isLoading.value = false;
      }
    } else {
      Get.snackbar(
        "Error",
        "Token is null",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }


  void showLogoutDialog({required VoidCallback onConfirm}) {
    Get.defaultDialog(
      backgroundColor: Colors.white,
      title: "Logout",
      titleStyle: GoogleFonts.andika(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      middleText: "Are you sure you want to logout\nfrom the application?",
      middleTextStyle: GoogleFonts.andika(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ),
      radius: 10.r,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      actions: [
        OutlinedButton(
          onPressed: () {
            Get.back();
            onConfirm();
          },
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.white),
          child: Text(
            "Logout",
            style: GoogleFonts.andika(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => Get.back(),
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
          child: Text(
            "No",
            style: GoogleFonts.andika(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  void showDeleteDialog({required VoidCallback onConfirm}) {
    Get.defaultDialog(
      title: "Delete Account",
      backgroundColor: Colors.white,
      titleStyle: GoogleFonts.andika(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      middleText: "Are you sure you want to delete\nyour account?",
      middleTextStyle: GoogleFonts.andika(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ),
      radius: 10.r,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      actions: [
        OutlinedButton(
          onPressed: () {
            Get.back();
            onConfirm();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          child: Text(
            "Delete",
            style: GoogleFonts.andika(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => Get.back(),
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
          child: Text(
            "No",
            style: GoogleFonts.andika(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
