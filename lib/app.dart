import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dependencies/app_dependency_provider.dart';
import 'dependencies/dependency_manager.dart';
import 'features/landing/landing_screen.dart';
import 'flavors.dart';
import 'generated/l10n.dart';
import 'routes/root_router.dart';
import 'themes/app_themes.dart';
import 'utils/context_utils.dart';

class App extends StatelessWidget {
  final DependencyManager dependencyManager;
  const App({
    super.key,
    required this.dependencyManager,
  });

  @override
  Widget build(BuildContext context) {
    final rootRouter = sl.get<RootRouter>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: F.name,
      navigatorKey: rootRouter.key,
      onGenerateRoute: rootRouter.getRoute,
      theme: AppThemes.lightTheme,
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      locale: const Locale("en", "GB"),
      supportedLocales: const [
        Locale('en', 'UK'),
      ],
      home: GestureDetector(
        onTap: hideKeyboard,
        child: AppDependencyProvider(
          child: LandingScreen(dependencyManager: dependencyManager),
        ),
      ),
    );
  }
}
