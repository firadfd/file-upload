import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helper/shared_prefarenses_helper.dart';
import '../../../core/service_class/network_caller/repository/network_caller.dart';

class EditProfileController extends GetxController {
  SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();
  RxBool isLoading = false.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Future<void> onInit() async {
    await sharedPreferencesHelper.init();
    super.onInit();
  }



  Future<void> updateProfile() async {
    var token = sharedPreferencesHelper.getString("userToken");
    final body = {
      "username": nameController.text,
      "email": emailController.text,
    };
    if (token != null) {
      try {
        isLoading.value = true;
        String url = "";
        final response = await NetworkCaller().patchRequest(url, body:body,token: token);
        if (response.isSuccess) {
          Get.back();
          Get.snackbar(
            "Success",
            "User profile updated successfully",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
          );
        } else {
          Get.snackbar(
            "Error",
            response.errorMessage,
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
}
