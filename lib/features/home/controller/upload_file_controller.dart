import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/global_widget/file_picker_controller.dart';
import '../../../core/helper/shared_prefarenses_helper.dart';

class UploadFileController extends GetxController {
  final SharedPreferencesHelper preferencesHelper = SharedPreferencesHelper();
  final pickerController = Get.put(FilePickerController());
  var selectedFile = Rxn<File>();
  var fileName = ''.obs;
  var fileSize = ''.obs;
  var isUploading = false.obs;
  var uploadProgress = 0.0.obs;
  var errorMessage = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await preferencesHelper.init();
  }

  Future<void> pickFile() async {
    try {
      errorMessage.value = '';

      await pickerController.pickFromStorage();

      if (pickerController.selectedFile.value != null) {
        File file = pickerController.selectedFile.value!;

        int fileSizeInBytes = await file.length();
        double fileSizeInMB = fileSizeInBytes / (1024 * 1024);

        if (fileSizeInMB > 10) {
          errorMessage.value = 'File size must be less than 10MB';
          pickerController.clearImages();
          return;
        }

        selectedFile.value = file;
        fileName.value = file.path.split('/').last;
        fileSize.value = _formatFileSize(fileSizeInBytes);

        Get.snackbar(
          'Success',
          'File selected successfully',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
        );

        pickerController.clearImages();
      } else {
        print('File selection canceled');
      }
    } catch (e) {
      errorMessage.value = 'Failed to select file: ${e.toString()}';
      print('Error picking file: $e');
    }
  }

  void removeFile() {
    selectedFile.value = null;
    fileName.value = '';
    fileSize.value = '';
    errorMessage.value = '';
  }

  Future<void> uploadFile() async {
    Get.back();
  }

  Future<void> pickImageFromCamera() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        maxWidth: 1920,
        maxHeight: 1080,
      );

      if (image != null) {
        selectedFile.value = File(image.path);
        fileName.value = image.name;
        fileSize.value = _formatFileSize(await selectedFile.value!.length());
        errorMessage.value = '';
      }
    } catch (e) {
      errorMessage.value = 'Failed to capture image: ${e.toString()}';
    }
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}
