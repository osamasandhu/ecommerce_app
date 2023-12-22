import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DialogError implements Exception {
  late String title;
  late String description;

  DialogError({
    required this.description,
    required this.title,
  });

  DialogError.withDioError(error) {
    debugPrint('E : ${error.message}');
    title = 'Error';
    description = '';
    if (error is DioError) {
      if ((error.response?.statusCode ?? 0) == 401) {
        description = 'You have entered an invalid username or password.';
      } else if ((error.response?.statusCode ?? 0) == 406) {
        description = error.response?.data['message'] ?? error406;
      } else if ((error.message?.contains('SocketException') ?? true) ||
          (error.message?.contains('Connecting timed') ?? true)) {
        description = 'Internet Connection Error';
      } else if ((error.response?.statusCode ?? 0) == 400) {
        description = error.response?.data?['message']?[0] ?? '';
      } else if ((error.response?.statusCode ?? 0) == 413) {
        description = imageGreater1MB;
      } else {
        try {
          description =
          'Failed to complete the process because of Connection interruption.';
        } catch (e, s) {
          debugPrint(s.toString());
        }
      }
    } else {
      description = error.toString();
    }
  }
}

String error406 =
    'The email you entered already exists. If you have trouble signing in try resetting your password or contact support.';
String imageGreater1MB =
    'Image size is greater than 1MB.Kindly select an image of size less than 1MB.';