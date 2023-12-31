import 'package:easy_shopping/core/data/enums/reouest_type.dart';
import 'package:easy_shopping/ui/shared/utils.dart';

class NetworkConfig {
  static String BASE_API = 'api/web/';
  String getFullApiRout(String apirout) {
    return BASE_API + apirout;
  }

  static Map<String, String> getHeaders(
      {bool? needAuth = true,
      required RequestType requestType,
      Map<String, String>? extraHeaders = const {}}) {
    return {
      if (needAuth!)
      //??qustion
        "Authorization": "Bearer ${storage.getTokenInfo()?.accessToken ?? ''}",
      if (requestType != RequestType.GET) "Content-Type": "application/json",
      ...extraHeaders!
    };
  }
}
