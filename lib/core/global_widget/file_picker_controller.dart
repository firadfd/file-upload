import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class FilePickerController extends GetxController {
  RxList<File> selectedFiles = <File>[].obs;
  Rx<File?> selectedFile = Rx<File?>(null);

  Future<void> pickFromStorage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx'],
    );
    if (result != null && result.files.isNotEmpty) {
      selectedFile.value = File(result.files.single.path!);
    }
  }

  void clearImages() {
    selectedFile.value = null;
    selectedFiles.clear();
  }
}
