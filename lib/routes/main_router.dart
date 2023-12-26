import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:movie/features/settings/settings_screen.dart';
import '../features/base/base_screen.dart';
import 'route_helper.dart';

class MainRouter implements AppRouter {
  @override
  String get name => "main";

  final GlobalKey<NavigatorState> key = GlobalKey();

  // Indicate route endpoints here
  static const String base = '/';
  static const String settings = 'settings';

  final LinkedHashMap<String, RouteBuilder> routes = LinkedHashMap.from(
    <String, RouteBuilder>{
      base: ({settings}) => _buildRoute(
            const BaseScreen(),
            settings: settings,
          ),
      settings: ({settings}) => _buildRoute(
            const Settings(),
            settings: settings,
          ),
    },
  );

  /// The route being passed in [Navigator]'s onGenerateRoute
  Route getRoute(RouteSettings settings) {
    final route = routes[settings.name];
    assert(route != null, "Route is not declared");
    return route!(settings: settings);
  }

  static Route<T> _buildRoute<T>(
    Widget child, {
    required RouteSettings? settings,
    bool fullScreenDialog = false,
  }) {
    return CupertinoPageRoute<T>(
      settings: settings,
      fullscreenDialog: fullScreenDialog,
      builder: (context) {
        return child;
      },
    );
  }
}
