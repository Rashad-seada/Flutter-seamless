import 'package:connectivity_plus/connectivity_plus.dart';
import '../../errors/exception.dart';

abstract class NetworkService {

  Future<bool> get isConnected;

}

class NetworkServiceImpl implements NetworkService {

  @override
  Future<bool> get isConnected async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    try {
      return connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;
    } catch (e) {
      throw ServiceException("There was unexpected error, please try again");
    }
  }

}