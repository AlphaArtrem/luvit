///Interface for app config service
abstract class AppConfigServiceInterface {
  ///App display name
  late final String appName;

  ///App backend base URL for API calls
  late final String baseUrl;

  ///Function to setup app config
  void configApp() {
    throw UnimplementedError();
  }
}
