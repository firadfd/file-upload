import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helper/shared_prefarenses_helper.dart';
import '../../../core/service_class/network_caller/repository/network_caller.dart';

class EditProfileController extends GetxController {
  SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();
  RxBool isLoading = false.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  static List<String> goalsItems = ['Select', 'Read more books', 'Improve comprehension','Enjoy reading'];
  static List<String> ageItems = ['Age', '18-24', '25-34', '35-44', '45-54', '55+'];
  late String selectedGoal;
  late String selectedAge;

  @override
  Future<void> onInit() async {
    selectedGoal = "Select";
    selectedAge = "Age";
    // selectedValue = profileController.gender.value == "" ? "Select" : profileController.gender.value;
    // nameController.text = profileController.name.value;
    // emailController.text = profileController.email.value;
    await sharedPreferencesHelper.init();
    super.onInit();
  }

  void onChanged(String? newValue) {
    selectedGoal = newValue!;
  }

  void onAgeChanged(String? newValue) {
    selectedAge = newValue!;
  }

  Future<void> updateProfile() async {
    var token = sharedPreferencesHelper.getString("userToken");
    final body = {
      "username": nameController.text,
      "email": emailController.text,
      "gender": selectedAge,
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
