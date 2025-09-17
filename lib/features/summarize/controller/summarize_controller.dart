import 'package:get/get.dart';

import '../../../core/helper/shared_prefarenses_helper.dart';

class SummarizeController extends GetxController {
  SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();

  @override
  Future<void> onInit() async {
    super.onInit();
    await sharedPreferencesHelper.init();
  }
}
