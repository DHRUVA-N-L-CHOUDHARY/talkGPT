import 'package:connectivity/connectivity.dart';

import 'package:fluttertoast/fluttertoast.dart';

Future<bool> check() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

showToast(String text) {
  Fluttertoast.showToast(
      msg: text, toastLength: Toast.LENGTH_LONG, fontSize: 16);
}