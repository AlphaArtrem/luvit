import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_call_outcome/flutter_call_outcome.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:luvit/service_layer/api_service/api_service_interface.dart';
import 'package:luvit/service_layer/app_config/app_config_service_impl.dart';

///[ApiServiceInterface] implementation for making API requests
class ApiService implements ApiServiceInterface {
  ///Default constructor for [ApiService].
  ///Takes [AppConfigService] as a parameter
  ApiService(this.appConfigService);

  ///[Logger] instance to print console logs
  final Logger log = Logger(
    printer: PrettyPrinter(methodCount: 4, lineLength: 1000),
    filter: ProductionFilter(),
    level: Level.debug,
  );

  @override
  final AppConfigService appConfigService;

  @override
  Future<CallOutcome<Map<String, dynamic>>> getRequest(
    String apiPath, {
    Map<String, String>? headers,
    bool useBaseUrl = true,
  }) {
    // TODO(Yash): implement getRequest
    throw UnimplementedError();
  }

  @override
  Future<CallOutcome<Map<String, dynamic>>> patchRequest(
    String apiPath,
    Map<String, dynamic> postData, {
    Map<String, String>? headers,
    bool useBaseUrl = true,
  }) {
    // TODO(Yash): implement patchRequest
    throw UnimplementedError();
  }

  @override
  Future<CallOutcome<Map<String, dynamic>>> postRequest(
    String apiPath,
    Map<String, dynamic> postData, {
    Map<String, String>? headers,
    bool useBaseUrl = true,
  }) async {
    try {
      final result = await http.post(
        Uri.parse(useBaseUrl ? appConfigService.baseUrl + apiPath : apiPath),
        headers: headers,
        body: jsonEncode(postData),
      );
      if (result.statusCode == 200) {
        final data = jsonDecode(result.body) as Map<String, dynamic>;
        if (kDebugMode) {
          log.d(data);
        }
        return CallOutcome<Map<String, dynamic>>(
          data: data,
        );
      } else {
        if (kDebugMode) {
          log.e(result.body);
        }
        return CallOutcome(exception: Exception(result.body));
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        log.e(e);
      }
      return CallOutcome<Map<String, dynamic>>(exception: e);
    }
  }

  @override
  Future<CallOutcome<Map<String, dynamic>>> putRequest(
    String apiPath,
    Map<String, dynamic> postData, {
    Map<String, String>? headers,
    bool useBaseUrl = true,
  }) {
    // TODO(Yash): implement putRequest
    throw UnimplementedError();
  }
}
