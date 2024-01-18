import 'package:ecommerce_app/src/common_widgets/alert_dialogs.dart';
import 'package:ecommerce_app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

extension AsyncValueUI on AsyncValue {
  void handleErrorMessageWithDialog(BuildContext context) {
    showExceptionAlertDialog(
      context: context,
      title: 'Operation failed'.hardcoded,
      exception: error,
    );
  }
}
