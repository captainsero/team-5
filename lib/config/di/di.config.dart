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

import '../../features/auth/register/api/data_sources/register_remote_source_implementation.dart'
    as _i1056;
import '../../features/auth/register/api/register_api_client/register_api_client.dart'
    as _i453;
import '../../features/auth/register/data/data_sources/register_remote_source_contract.dart'
    as _i821;
import '../../features/auth/register/data/repo/register_repo_implementation.dart'
    as _i695;
import '../../features/auth/register/domain/repo/register_repo_contract.dart'
    as _i65;
import '../../features/auth/register/domain/use_cases/register_use_case.dart'
    as _i118;
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
    gh.factory<_i453.RegisterApiClient>(
      () => _i453.RegisterApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i821.RegisterRemoteSourceContract>(
      () => _i1056.RegisterRemoteSourceImplementation(
        registerApiClient: gh<_i453.RegisterApiClient>(),
      ),
    );
    gh.factory<_i65.RegisterRepoContract>(
      () => _i695.RegisterRepoImplementation(
        registerRemoteSourceContract: gh<_i821.RegisterRemoteSourceContract>(),
      ),
    );
    gh.factory<_i118.RegisterUseCase>(
      () => _i118.RegisterUseCase(
        registerRepoContract: gh<_i65.RegisterRepoContract>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
