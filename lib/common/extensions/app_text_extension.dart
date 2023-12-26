import 'package:flutter/material.dart';

extension BuildContextTextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
