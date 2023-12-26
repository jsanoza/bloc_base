import 'package:movie/core/bloc/state.dart';

class NetworkState extends BlocState {
  final bool isConnected;

  const NetworkState({
    this.isConnected = false,
  });

  @override
  List<Object?> get props => [isConnected];

  NetworkState copyWith({
    final bool? isConnected,
  }) {
    return NetworkState(
      isConnected: isConnected ?? this.isConnected,
    );
  }

  factory NetworkState.initial() {
    return const NetworkState(isConnected: false);
  }
}
