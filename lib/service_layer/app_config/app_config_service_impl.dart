import 'package:luvit/service_layer/app_config/app_config_service_interface.dart';

/// A class that provides app configuration settings and allows for easy
/// switching between different configurations based on the environment.
class AppConfigService extends AppConfigServiceInterface {
  ///Default constructor for [AppConfigService]
  AppConfigService() {
    configApp();
  }

  @override
  void configApp() {
    appName = const String.fromEnvironment('appName');
    baseUrl = const String.fromEnvironment('baseUrl');
  }
}
