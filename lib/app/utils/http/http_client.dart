import 'package:r5/app/utils/http/dio.dart';
import 'package:dio/dio.dart';

export 'package:dio/dio.dart';
export 'package:flutter_modular/flutter_modular.dart';

class VerifikHttpClient {
  VerifikHttpClient._();
  static final _singleton = VerifikHttpClient._();

  factory VerifikHttpClient() => _singleton;

  late VerifikSharedDio _msDio;

  Dio get msDio => _msDio.dio;
  VerifikSharedDio get verifikSharedDio => _msDio;

  VerifikHttpClient getInstance() {
    _singleton._msDio = VerifikSharedDio(
      baseUrl: 'https://demo.verifik.co',
    );
    return _singleton;
  }
}
