// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/forget_password/api/data_sources/forget_pass_remote_data_source_impl.dart'
    as _i970;
import '../../features/auth/forget_password/api/forget_pass_api_client/forget_pass_api_client.dart'
    as _i358;
import '../../features/auth/forget_password/data/data_sources/forget_pass_remote_data_source_contract.dart'
    as _i426;
import '../dio/dio_module.dart' as _i977;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i358.ForgetPassApiClient>(
      () => _i358.ForgetPassApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i426.ForgetPassRemoteDataSourceContract>(
      () => _i970.ForgetPassRemoteDataSourceImpl(
        forgetPassApiClient: gh<_i358.ForgetPassApiClient>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
