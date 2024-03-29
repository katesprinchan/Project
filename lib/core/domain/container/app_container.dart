import 'dart:developer';

import 'package:dex_course/features/advertisement/data/repository/advertisement_mocked_repository.dart';
import 'package:dex_course/features/advertisement/domain/repository/advertisement_repository.dart';
import 'package:dex_course/features/auth/data/source/auth_mocked_data_source.dart';
import 'package:dex_course/features/auth/domain/repository/auth_repository.dart';
import 'package:dex_course/features/filter/domain/service/filter_service.dart';
import 'package:dex_course/features/filter/domain/service/filter_state.dart';
import 'package:dex_course/features/settings/domain/service/settings_service.dart';
import 'package:dex_course/features/settings/domain/service/settings_state.dart';
import 'package:get_it/get_it.dart';

class AppContainer {
  late final ServiceScope serviceScope;
  late final RepositoryScope repositoryScope;
  late final FilterScope filterScope;

  AppContainer.init() {
    ready = initDependencies();
    GetIt.instance.registerSingleton(this);
  }

  factory AppContainer() => GetIt.instance<AppContainer>();

  late final Future<bool> ready;

  Future<bool> initDependencies() async {
    try {
      final authRepo = AuthRepository(AuthMockedDataSource());
      final AdvertisementRepository advertisementRepository =
          AdvertisementMockedRepository();

      repositoryScope = RepositoryScope(
        authRepository: authRepo,
        advertisementRepository: advertisementRepository,
      );

      final settingsService =
          SettingsService(const SettingsState(localeIndex: 0));

      serviceScope = ServiceScope(settingsService: settingsService);

      final filterService = FilterService(FilterState(selectedLocalities: []));

      filterScope = FilterScope(filterService: filterService);

      return true;
    } catch (e, st) {
      log('App Container has not been initialized', error: e, stackTrace: st);
      return false;
    }
  }
}

class ServiceScope {
  final SettingsService settingsService;

  ServiceScope({
    required this.settingsService,
  });
}

class RepositoryScope {
  final AuthRepository authRepository;
  final AdvertisementRepository advertisementRepository;

  RepositoryScope({
    required this.authRepository,
    required this.advertisementRepository,
  });
}

class FilterScope {
  final FilterService filterService;

  FilterScope({
    required this.filterService,
  });
}
