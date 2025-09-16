import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/helper/shared_prefarenses_helper.dart';
import '../../../core/route/app_route.dart';
import '../../../core/service_class/network_caller/repository/network_caller.dart';
import '../../../core/utility/app_urls.dart';

class SignInController extends GetxController {
  SharedPreferencesHelper preferencesHelper = SharedPreferencesHelper();
  RxBool isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Future<void> onInit() async {
    await preferencesHelper.init();
    super.onInit();
  }


  Future<void> signIn() async {
    Map<String, dynamic> registration = {
      "email": emailController.text,
      "password": passwordController.text
    };

    try {
      isLoading.value = true;

      String url = AppUrls.loginUrl;

      final response = await NetworkCaller().postRequest(
        url,
        body: registration,
      );

      if (response.isSuccess) {
        preferencesHelper.setString(
          "userToken",
          response.responseData['accessToken'],
        );
        final isSetup = response.responseData['isSetup'];
        if (isSetup) {
          preferencesHelper.setBool("isSetup", isSetup);
          Get.snackbar(
            "Success",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            "User logged in successfully",
            snackPosition: SnackPosition.TOP,
          );
          Get.offAllNamed(AppRoute.mainView);
        } else {
          preferencesHelper.setBool("isSetup", isSetup);
          Get.snackbar(
            "Success",
            backgroundColor: Colors.yellow,
            colorText: Colors.black,
            "User logged in successfully Setup your profile",
            snackPosition: SnackPosition.TOP,
          );
          Get.offAllNamed(AppRoute.mainView);
        }
      } else {
        Get.snackbar(
          "Error",
          response.errorMessage,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }



  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
