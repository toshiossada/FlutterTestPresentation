import 'package:dio/dio.dart';
import 'custom_interceptor.dart';

class CustomDio {
  final Dio client;

  CustomDio(this.client) {
    client.options = BaseOptions();

    client.interceptors.add(CustomInterceptors());

    client.options.connectTimeout = 25000;
  }
}
