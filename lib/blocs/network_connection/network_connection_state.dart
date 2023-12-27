import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_connection_state.freezed.dart';

@freezed
class NetworkState with _$NetworkState {
  const factory NetworkState({
    @Default(false) bool isConnected,
  }) = _NetworkState;

  factory NetworkState.initial() => const NetworkState();
}
