import 'package:flutter_call_outcome/flutter_call_outcome.dart';
import 'package:luvit/service_layer/app_config/app_config_service_interface.dart';

///Interface for making API requests
abstract class ApiServiceInterface {
  ///Default constructor for [ApiServiceInterface].
  ///Takes [AppConfigServiceInterface] as a parameter
  ApiServiceInterface(this.appConfigService);

  ///[AppConfigServiceInterface] implementation to fetch app details
  ///like baseUrl
  final AppConfigServiceInterface appConfigService;

  ///Function for GET API requests
  Future<CallOutcome<Map<String, dynamic>>> getRequest(
    String apiPath, {
    Map<String, String>? headers,
    bool useBaseUrl = true,
  });

  ///Function for POST API requests
  Future<CallOutcome<Map<String, dynamic>>> postRequest(
    String apiPath,
    Map<String, dynamic> postData, {
    Map<String, String>? headers,
    bool useBaseUrl = true,
  });

  ///Function for PATCH API requests
  Future<CallOutcome<Map<String, dynamic>>> patchRequest(
    String apiPath,
    Map<String, dynamic> postData, {
    Map<String, String>? headers,
    bool useBaseUrl = true,
  });

  ///Function for PUT API requests
  Future<CallOutcome<Map<String, dynamic>>> putRequest(
    String apiPath,
    Map<String, dynamic> postData, {
    Map<String, String>? headers,
    bool useBaseUrl = true,
  });
}
