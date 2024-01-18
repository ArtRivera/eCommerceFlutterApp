import 'package:ecommerce_app/src/common_widgets/error_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget(
      {super.key, required this.asyncValue, required this.dataBuilder});

  final AsyncValue<T> asyncValue;
  final Widget Function(T) dataBuilder;

  @override
  Widget build(BuildContext context) {
    return asyncValue.when(
      data: dataBuilder,
      error: (error, stackTrace) => ErrorMessageWidget(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
