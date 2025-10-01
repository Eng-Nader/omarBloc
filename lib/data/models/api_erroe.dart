import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

class ApiErroe {
  final IconData icon;
  final String title, subTitle;

  const ApiErroe(this.icon, this.subTitle, this.title);

  factory ApiErroe.handler(dynamic e) {
    if (e is Exception) {
      if (e is DioException) {
       
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
            return ApiErroe(
             Icons.wifi,
              'You Are Currently Offline',
              'Please Check your internet',
            );
          case DioExceptionType.sendTimeout:
            return ApiErroe(
           Icons.timer_off,
              'Send Timeout',
              'The request took too long to send.',
            );
          case DioExceptionType.receiveTimeout:
            return ApiErroe(
              Icons.timer_off,
              'Receive Timeout',
              'The server took too long to respond.',
            );
          case DioExceptionType.badCertificate:
            return ApiErroe(
             Icons.security,
              'Bad Certificate',
              'Could not verify server certificate.',
            );
          case DioExceptionType.badResponse:
            return ApiErroe(
             Icons.error,
              'Bad Response',
              'Received an invalid response from the server.',
            );
          case DioExceptionType.cancel:
            return ApiErroe(
              Icons.cancel,
              'Request Cancelled',
              'The request was cancelled.',
            );
          case DioExceptionType.connectionError:
            return ApiErroe(
             Icons.cloud_off,
              'Connection Error',
              'Failed to connect to the server.',
            );
          case DioExceptionType.unknown:
            return ApiErroe(
              Icons.help_outline,
              'Unknown Error',
              'An unexpected error occurred.',
            );
        }
      }
    }
    return ApiErroe(
      Icons.error_outline,
      'Error',
      'An error occurred.',
    );
  }
}
