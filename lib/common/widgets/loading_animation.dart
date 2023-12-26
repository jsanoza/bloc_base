import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie/themes/app_colors.dart';

class CustomLoadingAnimation extends StatelessWidget {
  final double? size;
  const CustomLoadingAnimation({
    super.key,
    this.size = 75,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: AppColors.white,
        size: size!,
      ),
    );
  }
}
