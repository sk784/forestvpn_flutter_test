// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:forestvpn_test/data/mock_news_repository.dart' as _i4;
import 'package:forestvpn_test/data/repository.dart' as _i3;
import 'package:forestvpn_test/presentation/home/home_cubit.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.NewsRepository>(() => _i4.MockNewsRepository());
    gh.factory<_i5.HomeCubit>(() => _i5.HomeCubit(gh<_i3.NewsRepository>()));
    return this;
  }
}
