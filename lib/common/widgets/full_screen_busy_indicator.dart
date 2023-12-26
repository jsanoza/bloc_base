import 'package:flutter/material.dart';
import 'package:movie/themes/app_colors.dart';
import '../../dependencies/dependency_manager.dart';
import '../services/busy_indicator_helper.dart';
import 'loading_animation.dart';

class FullScreenBusyIndicator extends StatefulWidget {
  const FullScreenBusyIndicator({super.key});

  @override
  State<StatefulWidget> createState() => _FullScreenBusyIndicatorState();
}

class _FullScreenBusyIndicatorState extends State<FullScreenBusyIndicator>
    implements BusyIndicatorController {
  bool show = false;

  @override
  void initState() {
    sl<BusyIndicatorHelper>().init(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (show) {
      final screenSize = MediaQuery.of(context).size;

      if (sl<BusyIndicatorHelper>().type ==
          FullScreenBusyIndicatorType.customType) {
        return Container(
          padding: const EdgeInsets.all(80),
          width: screenSize.width,
          height: screenSize.height,
          color: AppColors.white,
          child: const Center(child: CustomLoadingAnimation()),
        );
      }

      // default indicator
      return Container(
        padding: const EdgeInsets.all(80),
        width: screenSize.width,
        height: screenSize.height,
        color: AppColors.black.withOpacity(.50),
        child: const Center(child: CustomLoadingAnimation()),
      );
    }

    return const SizedBox();
  }

  @override
  void hideBusyIndicator() {
    setState(() {
      show = false;
    });
  }

  @override
  void showBusyIndicator() {
    setState(() {
      show = true;
    });
  }
}
