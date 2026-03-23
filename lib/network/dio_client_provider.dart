import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_client_provider.g.dart';

enum AppEnvironment {
  localMockoon,
  staging,
  production,
}

final APP_MODE = AppEnvironment.localMockoon;

const String localBaseUrl = 'http://192.168.18.77';
const String stagingBaseUrl = 'https://api-staging.example.com';
const String productionBaseUrl = 'https://api.example.com';

const String appEnv = String.fromEnvironment('APP_ENV', defaultValue: 'production');
const String apiBaseUrlOverride =
    String.fromEnvironment('API_BASE_URL', defaultValue: '');

@riverpod
Dio dioClient(Ref ref) {
  final baseUrl = apiBaseUrlOverride.isNotEmpty
      ? apiBaseUrlOverride
      : (appEnv == 'staging' ? stagingBaseUrl : productionBaseUrl);

  return Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
}

