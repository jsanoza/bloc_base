import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/helpers/network_service.dart';
import 'network_connection_event.dart';
import 'network_connection_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc._() : super(NetworkState.initial()) {
    on<NetworkObserve>(_observe);
    on<NetworkNotify>(_notifyStatus);
  }

  static final NetworkBloc _instance = NetworkBloc._();

  factory NetworkBloc() => _instance;

  void _observe(event, emit) {
    NetworkService.observeNetwork();
  }

  void _notifyStatus(NetworkNotify event, emit) {
    event.isConnected
        ? emit(state.copyWith(isConnected: true))
        : emit(state.copyWith(isConnected: false));
  }
}
