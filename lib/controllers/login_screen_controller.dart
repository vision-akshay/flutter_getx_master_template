import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import '../api_service/api_common_service/api_data_source.dart';
import '../api_service/api_common_service/api_error_handling.dart';
import '../api_service/api_common_service/api_request.dart';
import '../api_service/requests/login_request.dart';
import '../utils/app_strings.dart';
import '../utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignInScreenController extends GetxController {
  Rx<TextEditingController> mobileNumberController =
      TextEditingController().obs;
  RxBool isLoading = false.obs;
  late APIResult result;
  // final formKey = GlobalKey<FormState>();
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  String deviceId = '';

  onPressedButton() async {
    final isValidate = formKey.value.currentState?.validate();

    if (isValidate != true) {
      return;
    }
    formKey.value.currentState?.save();

    Map<String, dynamic> requestBody = {
      "data": {
        "langType": '1',
        "phone": mobileNumberController.value.text,
        "deviceId": deviceId,
      }
    };
    log('json body------->${json.encode(requestBody)}');
    await _loginApiCall(LoginRequest(request: requestBody), ApiDataSource());
  }

  Future<void> _loginApiCall(
      RemoteRequest remoteRequest, ApiDataSource apiDataSource) async {
    try {
      isLoading(true);
      result = await apiDataSource.makeRequest(remoteRequest);
      log('result body------->${result.data}');

      if (result.statusCode == 200) {
        log('status code--->${result.statusCode}');
        if (result.data['status'].toString() == '7') {
          CommonMethods.sucessSnackBar(message: 'OTP sent Successfully');
          isLoading(false);

          // Get.toNamed(AppRoutes.otpScreen, );
        } else {
          CommonMethods.errorSnackBar(result.data['message'].toString());
        }
      } else {
        CommonMethods.errorSnackBar(AppStrings.somethingWrongTryAgain);
      }
    } on SocketException {
      CommonMethods.errorSnackBar(InternetConnectionException());
    } on TimeoutException {
      CommonMethods.errorSnackBar(InternetConnectionException());
    }
    isLoading(false);
  }
}
