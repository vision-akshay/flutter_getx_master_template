import '../utils/app_colors.dart';
import 'package:get/get.dart';

class CommonMethods {
  CommonMethods._();

  static showToast({required String title, required dynamic message}) {
    return Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: '$message',
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static errorSnackBar(message) {
    return Get.snackbar(
      "Error",
      "$message",
      snackPosition: SnackPosition.TOP,
      colorText: AppColors.whiteColor,
      borderRadius: 10,
      backgroundColor: AppColors.redColor,
    );
  }

  static sucessSnackBar({required String message}) {
    return Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.TOP,
      colorText: AppColors.whiteColor,
      borderRadius: 10,
      backgroundColor: AppColors.greenColor,
    );
  }

}
