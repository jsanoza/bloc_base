import 'package:flutter/material.dart';

/// Helps manage a global busy indicator widget.
///
/// This shouldn't be confused with the usage of [ModalService] which similarly
/// draws widget on top of the [MainRouter] screens. This simply drives the
/// top level screen [LandingScreen].
class BusyIndicatorHelper {
  BusyIndicatorController? _controller;
  FullScreenBusyIndicatorType? type = FullScreenBusyIndicatorType.defaultType;
  int _queueCount = 0;

  /// Initializes the busy indicator. Must only be attached to a
  /// [StatefulWidget].
  void init(BusyIndicatorController controller) {
    assert(controller is State, "Must attach only to StatefulWidget");
    _controller = controller;
  }

  /// NOTE: Showing the busy indicator will block user interaction. Make sure
  /// that callers should unlock the UI by eventually calling [requestDismiss].
  /// A really good way to do this is to call this method at start of try block
  /// then [requestDismiss] on a finally block. This ensures that the unlocking
  /// will happen no matter what the try block's outcome is. (Errors might not
  /// execute portion of the try block, but with finally block, it will be
  /// executed no matter what).
  /// How To Use:
  /// sl<BusyIndicatorHelper>().requestShow(type: FullScreenBusyIndicatorType.courseType);
  /// sl<BusyIndicatorHelper>().requestDismiss();
  void requestShow(
      {FullScreenBusyIndicatorType? type =
          FullScreenBusyIndicatorType.defaultType}) {
    assert(
      _controller != null,
      "Controller must be initialized and implemented"
      " first",
    );
    this.type = type;

    _queueCount++;

    _maybePresentOrDismiss();
  }

  void requestDismiss() {
    if (_queueCount > 0) {
      _queueCount--;
    }

    _maybePresentOrDismiss();
  }

  bool isShown() {
    return _queueCount > 0;
  }

  void _maybePresentOrDismiss() {
    if (_queueCount > 0) {
      _controller?.showBusyIndicator();
    } else {
      _controller?.hideBusyIndicator();
    }
  }
}

/// Represents the widget which will control the showing and hiding of the
/// indicator.
abstract class BusyIndicatorController {
  void showBusyIndicator();

  void hideBusyIndicator();
}

enum FullScreenBusyIndicatorType { defaultType, customType }
