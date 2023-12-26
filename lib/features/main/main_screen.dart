import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:toastification/toastification.dart';
import '../../blocs/network_connection/network_connection_bloc.dart';
import '../../blocs/network_connection/network_connection_state.dart';
import '../../common/services/toast_service.dart';
import '../../dependencies/dependency_manager.dart';
import '../../generated/l10n.dart';
import '../../routes/main_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isInitialBuild = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final router = sl.get<MainRouter>();
    final String initialRoute = _getInitialRoute(context);
    return BlocConsumer<NetworkBloc, NetworkState>(
      listener: (context, state) {
        sl<Logger>().i("NetworkBloc: ${state.isConnected}");

        if (_isInitialBuild) {
          _isInitialBuild = false;
          return;
        }

        if (state.isConnected) {
          sl<ToastService>().showToast(
            context: context,
            title: S.current.networkReconnected,
            description: S.current.networkReconnectedDescription,
            type: ToastificationType.success,
            style: ToastificationStyle.flat,
          );
        }

        if (!state.isConnected) {
          sl<ToastService>().showToast(
            context: context,
            title: S.current.networkDisconnected,
            description: S.current.networkDisconnectedDescription,
            type: ToastificationType.error,
            style: ToastificationStyle.fillColored,
          );
        }
      },
      builder: (context, state) {
        return Navigator(
          key: router.key,
          initialRoute: initialRoute,
          onGenerateRoute: router.getRoute,
        );
      },
    );
  }

  String _getInitialRoute(BuildContext context) {
    // Prompt user with personal info if not yet set
    // if (userAccount?.firstName == null ||
    //     (userAccount?.firstName?.isEmpty ?? true)) {
    //   return MainRouter.fillPersonalInformation;
    // }

    return MainRouter.base;
  }
}
