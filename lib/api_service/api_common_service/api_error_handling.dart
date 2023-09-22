import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'api_data_source.dart';

dynamic response(APIResult response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.data.toString());
      return responseJson;
    case 400:
      return _errorSnackBar("${BadRequestException(response.data.toString())}");
    case 401:
    case 403:
      return _errorSnackBar(
          "${UnauthorisedException(response.data.toString())}");
    case 500:
    default:
      return _errorSnackBar(
          "${FetchDataException('An error occurred while communicating with the server using StatusCode : ${response.statusCode}')}");
  }
}

_errorSnackBar(message) {
  return Get.snackbar(
    "Error",
    "$message",
    snackPosition: SnackPosition.TOP,
    colorText: Colors.white,
    borderRadius: 10,
    backgroundColor: Colors.redAccent,
  );
}

class CustomException implements Exception {
  final dynamic message;
  final dynamic prefix;

  CustomException([this.message, this.prefix]);

  @override
  String toString() {
    return "$prefix${message ?? ''}";
  }
}

class InternetConnectionException extends CustomException {
  InternetConnectionException([String? message])
      : super(message, "Please check your Internet Connection");
}

class FetchDataException extends CustomException {
  FetchDataException([String? message]) : super(message, "");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
