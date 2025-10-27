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

import '../../features/auth/data_source/auth_remot_data_source.dart' as _i149;
import '../../features/auth/data_source/auth_remot_data_source_impl.dart'
    as _i982;
import '../../features/auth/data_source/auth_repo_impl.dart' as _i62;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
import '../../features/auth/domain/use-cases/login_use_case.dart' as _i98;
import '../../features/auth/domain/use-cases/register_use_case.dart' as _i1015;
import '../../features/auth/ui/view_model/login_cubit/login_cubit.dart'
    as _i544;
import '../../features/auth/ui/view_model/register_cubit/register_cubit.dart'
    as _i733;
import '../../features/tabs/home/data_source/home_remote_data_source.dart'
    as _i814;
import '../../features/tabs/home/data_source/home_remote_data_source_impl.dart'
    as _i903;
import '../../features/tabs/home/data_source/home_repo_impl.dart' as _i492;
import '../../features/tabs/home/domain/home_repo.dart' as _i144;
import '../../features/tabs/home/domain/use_case/category_use_case.dart'
    as _i879;
import '../../features/tabs/home/domain/use_case/products_use_case.dart'
    as _i927;
import '../../features/tabs/home/ui/view_model/category_cubit/category_cubit.dart'
    as _i812;
import '../../features/tabs/home/ui/view_model/products_cubit/products_cubit.dart'
    as _i459;
import '../network/api/api_service.dart' as _i630;
import '../shared_pref_helper/shared_pref_helper.dart' as _i1062;
import 'get_it_module.dart' as _i1015;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.factory<_i1062.SharedPrefHelper>(() => _i1062.SharedPrefHelper());
    gh.lazySingleton<_i361.Dio>(() => getItModule.getDio());
    gh.lazySingleton<_i630.ApiService>(
      () => getItModule.getApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i149.AuthRemoteDataSource>(
      () => _i982.AuthRemoteDataSourceImpl(gh<_i630.ApiService>()),
    );
    gh.factory<_i170.AuthRepo>(
      () => _i62.AuthRepoImpl(
        gh<_i149.AuthRemoteDataSource>(),
        gh<_i1062.SharedPrefHelper>(),
      ),
    );
    gh.factory<_i1015.RegisterUseCase>(
      () => _i1015.RegisterUseCase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i98.LoginUseCase>(
      () => _i98.LoginUseCase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i814.HomeRemoteDataSource>(
      () => _i903.HomeRemoteDataSourceImpl(gh<_i630.ApiService>()),
    );
    gh.factory<_i544.LoginCubit>(
      () => _i544.LoginCubit(gh<_i98.LoginUseCase>()),
    );
    gh.factory<_i144.HomeRepo>(
      () => _i492.HomeRepoImpl(gh<_i814.HomeRemoteDataSource>()),
    );
    gh.factory<_i733.RegisterCubit>(
      () => _i733.RegisterCubit(gh<_i1015.RegisterUseCase>()),
    );
    gh.factory<_i879.CategoryUseCase>(
      () => _i879.CategoryUseCase(gh<_i144.HomeRepo>()),
    );
    gh.factory<_i927.ProductsUseCase>(
      () => _i927.ProductsUseCase(gh<_i144.HomeRepo>()),
    );
    gh.factory<_i459.ProductsCubit>(
      () => _i459.ProductsCubit(gh<_i927.ProductsUseCase>()),
    );
    gh.factory<_i812.CategoryCubit>(
      () => _i812.CategoryCubit(gh<_i879.CategoryUseCase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i1015.GetItModule {}
