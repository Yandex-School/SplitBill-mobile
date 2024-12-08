import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:split_bill/core/DI/dependencies_config.dart';
import 'package:split_bill/core/local_data/shared_preferences.dart';
import 'package:split_bill/core/utils/const.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final creds = getIt<SharedPrefsService>();
    final userId = creds.getInt(Constants.USER_ID);

    if (creds.getInt(Constants.USER_ID) != null) {
      options.headers['X-Ya-User-Ticket'] = userId;
    }

    log("userID: ${userId.toString()}");
    super.onRequest(options, handler);
  }
}
