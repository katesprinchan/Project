import 'package:dex_course/core/domain/container/app_container.dart';
import 'package:dex_course/features/advertisement/presentation/page/advertisement_list_page.dart';
import 'package:dex_course/features/advertisement/presentation/page/advertisement_list_vm.dart';
import 'package:dex_course/features/auth/presentation/auth_page.dart';
import 'package:dex_course/features/auth/presentation/auth_vm.dart';
import 'package:dex_course/features/init/presentation/init_page.dart';
import 'package:dex_course/features/init/presentation/init_vm.dart';
import 'package:dex_course/features/recovery/presentation/code_validation.dart';
import 'package:dex_course/features/recovery/presentation/forgot-password.dart';
import 'package:dex_course/features/recovery/presentation/new_password.dart';
import 'package:dex_course/features/recovery/presentation/recovery_vm.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouteList {
  static const init = '/init';

  static const auth = '/auth';

  static const forgotPassword = 'forgotPassword';

  static const codeValidation = 'codeValidation';

  static const newPassword = 'newPassword';

  static const advertisementListPage = '/advListPage';
}

abstract class AppRouterConfig {
  static final instance = GoRouter(
    initialLocation: AppRouteList.init,
    routes: [
      GoRoute(
        path: AppRouteList.init,
        builder: (context, state) => const InitPage(
          vm: InitViewModel(),
        ),
      ),
      GoRoute(
        path: AppRouteList.auth,
        builder: (context, state) {
          return AuthPage(
            vm: AuthViewModel(
              authRepository: AppContainer().repositoryScope.authRepository,
              settingService: AppContainer().serviceScope.settingsService,
            ),
          );
        },
        routes: [
          GoRoute(
            path: AppRouteList.forgotPassword,
            builder: (context, state) {
              return RecoveryPage(
                vm: RecoveryViewModel(
                  authRepository: AppContainer().repositoryScope.authRepository,
                  settingService: AppContainer().serviceScope.settingsService,
                ),
              );
            },
            routes: [
              GoRoute(
                path: AppRouteList.codeValidation,
                builder: (context, state) {
                  return EnterCodePage(
                    vm: RecoveryViewModel(
                      authRepository:
                          AppContainer().repositoryScope.authRepository,
                      settingService:
                          AppContainer().serviceScope.settingsService,
                    ),
                  );
                },
              ),
              GoRoute(
                path: AppRouteList.newPassword,
                builder: (context, state) {
                  return NewPasswordPage(
                    vm: RecoveryViewModel(
                      authRepository:
                          AppContainer().repositoryScope.authRepository,
                      settingService:
                          AppContainer().serviceScope.settingsService,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRouteList.advertisementListPage,
        builder: (context, state) => AdvertisementListPage(
          vm: AdvertisementListViewModel(
            advertisementRepository:
                AppContainer().repositoryScope.advertisementRepository,
            filterService: AppContainer().filterScope.filterService,
          ),
        ),
      ),
    ],
  );
}
