import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable_init.config.dart';

@InjectableInit()
GetIt configureDependencies() => GetIt.I.init();