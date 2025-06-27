// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:indrive_client/data/data_source/local/shared_pref.dart'
    as _i210;
import 'package:indrive_client/data/data_source/remote/services/auth_service.dart'
    as _i47;
import 'package:indrive_client/di/app_module.dart' as _i301;
import 'package:indrive_client/domain/repository/auth_repository.dart' as _i867;
import 'package:indrive_client/domain/use_cases/auth/auth_use_cases.dart'
    as _i563;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i210.SharedPref>(() => appModule.sharedPref);
    gh.factory<_i47.AuthService>(() => appModule.authService);
    gh.factory<_i867.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i563.AuthUseCases>(() => appModule.authUseCases);
    return this;
  }
}

class _$AppModule extends _i301.AppModule {}
