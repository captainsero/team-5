import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/core/constants/base_urls.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: BaseUrls.baseUrl,
      sendTimeout: const Duration(seconds: 5),
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );
}
