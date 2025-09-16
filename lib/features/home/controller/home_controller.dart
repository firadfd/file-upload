import 'package:get/get.dart';

import '../../../core/helper/shared_prefarenses_helper.dart';

class HomeController extends GetxController {
  final SharedPreferencesHelper preferencesHelper = SharedPreferencesHelper();

  @override
  Future<void> onInit() async {
    super.onInit();
    await preferencesHelper.init();
  }

}
