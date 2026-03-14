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

import '../../features/auth/login_screen/api/auth_api_client/auth_api_client.dart'
    as _i721;
import '../../features/auth/login_screen/api/data_sources/auth_remote_data_source_impl.dart'
    as _i156;
import '../../features/auth/login_screen/data/data_sources/auth_remote_data_source_contract.dart'
    as _i394;
import '../../features/auth/login_screen/data/repo/auth_repo_impl.dart'
    as _i172;
import '../../features/auth/login_screen/domain/repo/auth_repo_contract.dart'
    as _i498;
import '../../features/auth/login_screen/domain/use_cases/login_use_cases.dart'
    as _i70;
import '../../features/auth/login_screen/presentations/view_model/cubit/login_view_model.dart'
    as _i952;
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
    gh.factory<_i721.AuthApiClient>(() => _i721.AuthApiClient(gh<_i361.Dio>()));
    gh.factory<_i394.AuthRemoteDataSourceContract>(
      () => _i156.AuthRemoteDataSourceImpl(gh<_i721.AuthApiClient>()),
    );
    gh.factory<_i498.AuthRepoContract>(
      () => _i172.AuthRepoImpl(
        remoteDataSource: gh<_i394.AuthRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i70.LoginUseCase>(
      () => _i70.LoginUseCase(repo: gh<_i498.AuthRepoContract>()),
    );
    gh.factory<_i952.LoginViewModel>(
      () => _i952.LoginViewModel(loginUseCase: gh<_i70.LoginUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
