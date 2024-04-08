import 'package:dex_course/core/domain/container/app_container.dart';
import 'package:dex_course/features/aboutApp/presentation/about_application.dart';
import 'package:dex_course/features/advertisement/presentation/page/advertisement_add_page.dart';
import 'package:dex_course/features/advertisement/presentation/page/advertisement_detailed_list_page.dart';
import 'package:dex_course/features/advertisement/presentation/page/advertisement_favorite_page.dart';
import 'package:dex_course/features/advertisement/presentation/page/advertisement_favorite_vm.dart';
import 'package:dex_course/features/advertisement/presentation/page/advertisement_list_page.dart';
import 'package:dex_course/features/advertisement/presentation/page/advertisement_list_vm.dart';
import 'package:dex_course/features/auth/presentation/auth_page.dart';
import 'package:dex_course/features/auth/presentation/auth_vm.dart';
import 'package:dex_course/features/home/presentation/home_page.dart';
import 'package:dex_course/features/init/presentation/init_page.dart';
import 'package:dex_course/features/init/presentation/init_vm.dart';
import 'package:dex_course/features/profile/presentation/page/editing_profile_page.dart';
import 'package:dex_course/features/profile/presentation/page/profile_page.dart';
import 'package:dex_course/features/profile/presentation/page/profile_vm.dart';
import 'package:dex_course/features/recovery/presentation/code_validation.dart';
import 'package:dex_course/features/recovery/presentation/forgot-password.dart';
import 'package:dex_course/features/recovery/presentation/new_password.dart';
import 'package:dex_course/features/recovery/presentation/recovery_vm.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouteList {
  static const init = '/init';

  static const auth = '/auth';

  static const _forgotPasswordPath = 'forgotPassword';
  static const forgotPassword = '$auth/$_forgotPasswordPath';

  static const _codeValidationPath = 'codeValidation';
  static const codeValidation = '$auth/$_codeValidationPath';

  static const _newPasswordPath = 'newPassword';
  static const newPassword = '$auth/$_newPasswordPath';

  static const advertisementListPage = '/advListPage';

  static const _advertisementDetailedPagePath = 'advertisementDetailedPage';
  static const advertisementDetailedPage =
      '$advertisementListPage/$_advertisementDetailedPagePath';

  static const _aboutApplicationPath = 'aboutApplication';
  static const aboutApplication =
      '$advertisementListPage/$_aboutApplicationPath';

  static const _advertisementAddPagePath = 'advertisementAddPage';
  static const advertisementAddPage =
      '$advertisementListPage/$_advertisementAddPagePath';

  static const advertisementFavoritePage = '/advertisementFavoritePage';

  static const profilePage = '/profilePage';

  static const _editingProfilePagePath = 'editingProfilePage';
  static const editingProfilePage = '$profilePage/$_editingProfilePagePath';
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
            path: AppRouteList._forgotPasswordPath,
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
                path: AppRouteList._codeValidationPath,
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
                path: AppRouteList._newPasswordPath,
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
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomePage(
            child: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            initialLocation: AppRouteList.advertisementListPage,
            routes: [
              GoRoute(
                path: AppRouteList.advertisementListPage,
                builder: (context, state) => AdvertisementListPage(
                  vm: AdvertisementListViewModel(
                    advertisementRepository:
                        AppContainer().repositoryScope.advertisementRepository,
                    filterService: AppContainer().filterScope.filterService,
                    settingService: AppContainer().serviceScope.settingsService,
                  ),
                ),
                routes: [
                  GoRoute(
                    path: AppRouteList._aboutApplicationPath,
                    builder: (context, state) => const AboutApplicationPage(),
                  ),
                  GoRoute(
                    path: AppRouteList._advertisementDetailedPagePath,
                    builder: (context, state) => AdvertisementDetailedPage(
                      vm: AdvertisementListViewModel(
                        advertisementRepository: AppContainer()
                            .repositoryScope
                            .advertisementRepository,
                        filterService: AppContainer().filterScope.filterService,
                        settingService:
                            AppContainer().serviceScope.settingsService,
                      ),
                    ),
                  ),
                  GoRoute(
                    path: AppRouteList._advertisementAddPagePath,
                    builder: (context, state) => const AdvertisementAddPage(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: AppRouteList.advertisementFavoritePage,
            routes: [
              GoRoute(
                path: AppRouteList.advertisementFavoritePage,
                builder: (context, state) => AdvertisementFavoritePage(
                  vm: AdvertisementFavoriteViewModel(
                    settingService: AppContainer().serviceScope.settingsService,
                  ),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: AppRouteList.profilePage,
            routes: [
              GoRoute(
                path: AppRouteList.profilePage,
                builder: (context, state) => ProfilePage(
                  vm: ProfileViewModel(
                    settingService: AppContainer().serviceScope.settingsService,
                  ),
                ),
                routes: [
                  GoRoute(
                    path: AppRouteList._editingProfilePagePath,
                    builder: (context, state) => const EditProfilePage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
