import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastService {
  final Toastification _toastification = Toastification();

  void showToast({
    required BuildContext context,
    required String title,
    required String description,
    ToastificationType? type = ToastificationType.success,
    Function()? onCloseButtonTap,
    Function()? onTap,
    Function()? onAutoCompleteCompleted,
    Function()? onDismissed,
    ToastificationStyle? style = ToastificationStyle.flat,
  }) {
    _toastification.show(
      context: context,
      type: type,
      title: title,
      description: description,
      alignment: Alignment.topRight,
      style: style,
      animationDuration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      closeButtonShowType: CloseButtonShowType.always,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      showProgressBar: false,
      autoCloseDuration: const Duration(seconds: 3),
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => onTap,
        onCloseButtonTap: (toastItem) => onCloseButtonTap,
        onAutoCompleteCompleted: (toastItem) => onAutoCompleteCompleted,
        onDismissed: (toastItem) => onDismissed,
      ),
    );
  }
}
