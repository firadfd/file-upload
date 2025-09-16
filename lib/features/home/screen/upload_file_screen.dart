import 'package:file_uploader/core/global_widget/custom_appbar.dart';
import 'package:file_uploader/core/global_widget/custom_elevated_button.dart';
import 'package:file_uploader/core/global_widget/custom_text_view.dart';
import 'package:file_uploader/features/home/controller/upload_file_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UploadFileScreen extends StatelessWidget {
  UploadFileScreen({super.key});

  final UploadFileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Upload File", center: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),

              Obx(
                () => controller.selectedFile.value == null
                    ? Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(24.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                          color: Colors.grey.shade50,
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.cloud_upload_outlined,
                              size: 48.sp,
                              color: Colors.grey.shade600,
                            ),
                            SizedBox(height: 16.h),
                            CustomTextView(
                              "Upload your file",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade700,
                            ),
                            SizedBox(height: 8.h),
                            CustomTextView(
                              "Drag and drop or choose from device",
                              fontSize: 14.sp,
                              color: Colors.grey.shade500,
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: controller.pickFile,
                                  icon: Icon(Icons.folder_open, size: 18.sp),
                                  label: CustomTextView("Browse Files"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 12.h,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: controller.pickImageFromCamera,
                                  icon: Icon(Icons.camera_alt, size: 18.sp),
                                  label: CustomTextView("Take Photo"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 12.h,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            CustomTextView(
                              "Supported: PDF, DOC, DOCX, JPG, PNG (Max 10MB)",
                              fontSize: 12.sp,
                              color: Colors.grey.shade500,
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
              ),

              // Selected File Info (same as before)
              Obx(
                () => controller.selectedFile.value != null
                    ? Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: Colors.grey.shade200),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade50,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: 20.sp,
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                CustomTextView(
                                  "File Ready to Upload",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green.shade700,
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                Icon(
                                  _getFileIcon(controller.fileName.value),
                                  size: 24.sp,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextView(
                                        controller.fileName.value,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      CustomTextView(
                                        controller.fileSize.value,
                                        fontSize: 12.sp,
                                        color: Colors.grey.shade600,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: controller.removeFile,
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                    size: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
              ),

              SizedBox(height: 30.h),

              // Upload Progress (same as before)
              Obx(
                () => controller.isUploading.value
                    ? Column(
                        children: [
                          LinearProgressIndicator(
                            value: controller.uploadProgress.value,
                            backgroundColor: Colors.grey.shade200,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.blue,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          CustomTextView(
                            "${(controller.uploadProgress.value * 100).toInt()}% uploaded",
                            fontSize: 12.sp,
                            color: Colors.grey.shade600,
                          ),
                          SizedBox(height: 20.h),
                        ],
                      )
                    : SizedBox.shrink(),
              ),

              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: CustomElevatedButton(
                    ontap: () {
                      controller.uploadFile();
                    },
                    backgroundColor: controller.isUploading.value
                        ? Colors.grey.shade300
                        : Colors.blue,
                    text: controller.isUploading.value
                        ? 'Uploading...'
                        : 'Upload File',
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Error Message (same as before)
              Obx(
                () => controller.errorMessage.value.isNotEmpty
                    ? Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: Colors.red.shade200),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 20.sp,
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: CustomTextView(
                                controller.errorMessage.value,
                                fontSize: 14.sp,
                                color: Colors.red.shade700,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getFileIcon(String fileName) {
    String extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'jpg':
      case 'jpeg':
      case 'png':
        return Icons.image;
      default:
        return Icons.insert_drive_file;
    }
  }
}
