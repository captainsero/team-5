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
import '../../features/auth/forget_password/data/repo/forget_pass_repo_impl.dart'
    as _i55;
import '../../features/auth/forget_password/domain/repo/forget_pass_repo_contract.dart'
    as _i222;
import '../../features/auth/forget_password/domain/use_cases/confirm_validation_code_use_case.dart'
    as _i146;
import '../../features/auth/forget_password/domain/use_cases/forget_pass_use_case.dart'
    as _i335;
import '../../features/auth/forget_password/domain/use_cases/reset_pass_use_case.dart'
    as _i262;
import '../../features/auth/forget_password/presentation/view_model/cubit/forget_pass_view_model.dart'
    as _i128;
import '../../features/auth/login/api/data_sources/login_remote_data_source_impl.dart'
    as _i584;
import '../../features/auth/login/api/login_api_client/login_api_client.dart'
    as _i251;
import '../../features/auth/login/data/data_sources/login_remote_data_source_contract.dart'
    as _i183;
import '../../features/auth/login/data/repo/login_repo_impl.dart' as _i1001;
import '../../features/auth/login/domain/repo/login_repo_contract.dart'
    as _i844;
import '../../features/auth/login/domain/use_cases/login_use_cases.dart'
    as _i685;
import '../../features/auth/login/presentations/view_model/cubit/login_view_model.dart'
    as _i370;
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
import '../../features/auth/register/presentation/view_model/register_view_model.dart'
    as _i656;
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
    gh.factory<_i251.LoginApiClient>(
      () => _i251.LoginApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i453.RegisterApiClient>(
      () => _i453.RegisterApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i183.AuthRemoteDataSourceContract>(
      () => _i584.AuthRemoteDataSourceImpl(gh<_i251.LoginApiClient>()),
    );
    gh.factory<_i426.ForgetPassRemoteDataSourceContract>(
      () => _i970.ForgetPassRemoteDataSourceImpl(
        forgetPassApiClient: gh<_i358.ForgetPassApiClient>(),
      ),
    );
    gh.factory<_i821.RegisterRemoteSourceContract>(
      () => _i1056.RegisterRemoteSourceImplementation(
        registerApiClient: gh<_i453.RegisterApiClient>(),
      ),
    );
    gh.factory<_i844.AuthRepoContract>(
      () => _i1001.AuthRepoImpl(
        remoteDataSource: gh<_i183.AuthRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i685.LoginUseCase>(
      () => _i685.LoginUseCase(repo: gh<_i844.AuthRepoContract>()),
    );
    gh.factory<_i65.RegisterRepoContract>(
      () => _i695.RegisterRepoImplementation(
        registerRemoteSourceContract: gh<_i821.RegisterRemoteSourceContract>(),
      ),
    );
    gh.factory<_i222.ForgetPassRepoContract>(
      () => _i55.ForgetPassRepoImpl(
        forgetPassRemoteDataSourceContract:
            gh<_i426.ForgetPassRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i118.RegisterUseCase>(
      () => _i118.RegisterUseCase(
        registerRepoContract: gh<_i65.RegisterRepoContract>(),
      ),
    );
    gh.factory<_i370.LoginViewModel>(
      () => _i370.LoginViewModel(loginUseCase: gh<_i685.LoginUseCase>()),
    );
    gh.factory<_i146.ConfirmValidationCodeUseCase>(
      () => _i146.ConfirmValidationCodeUseCase(
        forgetPassRepo: gh<_i222.ForgetPassRepoContract>(),
      ),
    );
    gh.factory<_i335.ForgetPassUseCase>(
      () => _i335.ForgetPassUseCase(
        forgetPassRepo: gh<_i222.ForgetPassRepoContract>(),
      ),
    );
    gh.factory<_i262.ResetPassUseCase>(
      () => _i262.ResetPassUseCase(
        forgetPassRepo: gh<_i222.ForgetPassRepoContract>(),
      ),
    );
    gh.factory<_i656.RegisterViewModel>(
      () =>
          _i656.RegisterViewModel(registerUseCase: gh<_i118.RegisterUseCase>()),
    );
    gh.factory<_i128.ForgetPassViewModel>(
      () => _i128.ForgetPassViewModel(
        forgetPassUseCase: gh<_i335.ForgetPassUseCase>(),
        confirmValidationCodeUseCase: gh<_i146.ConfirmValidationCodeUseCase>(),
        resetPassUseCase: gh<_i262.ResetPassUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
