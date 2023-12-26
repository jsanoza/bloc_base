import 'dart:collection';
import 'package:flutter/cupertino.dart';
import '../features/welcomeScreen/welcome_screen.dart';
import 'route_helper.dart';

class OnboardingRouter implements AppRouter {
  @override
  String get name => "onboarding";

  final GlobalKey<NavigatorState> key = GlobalKey();

  static const String login = 'login';
  static const String welcomeScreen = '/';

  final LinkedHashMap<String, RouteBuilder> routes = LinkedHashMap.from(
    <String, RouteBuilder>{
      // login: ({settings}) => _buildRoute(
      //       const AuthenticationScreen(),
      //       settings: settings,
      //     ),
      welcomeScreen: ({settings}) => _buildRoute(
            const WelcomeScreen(),
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
