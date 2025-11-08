import 'package:flutter/material.dart';
import 'package:lastsessiondevhub2/services/dio_helper.dart';
import 'package:lastsessiondevhub2/src/app_root.dart';

void main() {
    DioHelper.init();
  runApp(AppRoot());
}

