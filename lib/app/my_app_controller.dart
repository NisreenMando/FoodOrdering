


import 'package:easy_shopping/core/data/enums/connectivity_status_enums.dart';
import 'package:easy_shopping/core/services/base_controller.dart';
import 'package:easy_shopping/ui/shared/utils.dart';

class MyAppController extends BasController {
  ConnectivityStatus connectivityStatus = ConnectivityStatus.ONLINE;

  set setConnectivityStatus(ConnectivityStatus value) {
    connectivityStatus = value;
  }

  void listenForConnectivityStatus() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      setConnectivityStatus = event;
    });
  }

  @override
  void onInit() {
    listenForConnectivityStatus();
    super.onInit();
  }
}