import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helper/shared_prefarenses_helper.dart';
import '../../../core/route/app_route.dart';
import '../../../core/service_class/network_caller/model/network_response.dart';
import '../../../core/service_class/network_caller/repository/network_caller.dart';
import '../../../core/utility/app_urls.dart';

class SignUpController extends GetxController {
  SharedPreferencesHelper preferencesHelper = SharedPreferencesHelper();
  RxBool isLoading = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Future<void> onInit() async {
    await preferencesHelper.init();
    super.onInit();
  }

  Future<void> registerUser() async {
    isLoading.value = true;
    try {
      Map<String, dynamic> signUpData = {
        "fullName": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      };

      ResponseData response = await NetworkCaller().postRequest(
        AppUrls.registerUrl,
        body: signUpData,
      );

      if (response.isSuccess) {
        Get.toNamed(
          AppRoute.signOtp,
          arguments: {
            "email": emailController.text,
            "name": nameController.text,
            "password": passwordController.text,
          },
        );
      } else {
        Get.snackbar(
          'error:',
          response.errorMessage,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }


  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
