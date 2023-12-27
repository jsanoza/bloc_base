import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/blocs/file_upload/file_upload_bloc.dart';
import 'package:movie/blocs/image_upload/image_upload_bloc.dart';

import '../blocs/network_connection/network_connection_bloc.dart';

/// Provides context-based and disposable dependencies such as providers and
/// widget type services. This is mainly used to wrap high tree level widgets in
/// this case, [MainScreen].
///
/// A higher level (application) dependency provider similar to this is defined.
/// Check [AppDependencyProvider].
///
///
/// Here we can provide providers that can be used by user who are already authenticated inside the app

class AuthenticatedDependencyProvider extends StatelessWidget {
  const AuthenticatedDependencyProvider({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: true,
          create: (_) => FileUploadBloc(),
        ),
        BlocProvider(
          lazy: true,
          create: (_) => ImageUploadBloc(),
        ),
        BlocProvider<NetworkBloc>(
          lazy: true,
          create: (_) => NetworkBloc()..add(NetworkObserve()),
        ),
      ],
      child: child,
    );
  }
}
