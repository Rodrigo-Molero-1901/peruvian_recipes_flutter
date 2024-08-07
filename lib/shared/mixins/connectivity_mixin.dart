import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

mixin ConnectivityMixin {
  Future<bool> _hasConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    }
    return await InternetConnectionChecker().hasConnection;
  }

  Future<bool> get hasConnectivity async => await _hasConnectivity();
}
