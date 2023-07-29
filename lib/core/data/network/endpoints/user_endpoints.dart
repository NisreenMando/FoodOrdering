import 'package:easy_shopping/core/data/network/network_config.dart';

class UserEndpoints {
  static String login = NetworkConfig().getFullApiRout('user/login');
  static String register = NetworkConfig().getFullApiRout('user/register');
  
}
