import 'package:connectivity_plus/connectivity_plus.dart';
import '../../blocs/network_connection/network_connection_bloc.dart';

class NetworkService {
  void observeNetwork() {
    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.none) {
          NetworkBloc().add(NetworkNotify());
        } else {
          NetworkBloc().add(NetworkNotify(isConnected: true));
        }
      },
    );
  }
}
