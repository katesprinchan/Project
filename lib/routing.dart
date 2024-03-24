import 'package:dex_course/core/domain/container/app_container.dart';
import 'package:dex_course/features/auth/presentation/auth_page.dart';
import 'package:dex_course/features/auth/presentation/auth_vm.dart';
import 'package:dex_course/features/init/presentation/init_page.dart';
import 'package:dex_course/features/init/presentation/init_vm.dart';
import 'package:dex_course/features/recovery/presentation/enter_code.dart';
import 'package:dex_course/features/recovery/presentation/new_password.dart';
import 'package:dex_course/features/recovery/presentation/recovery_page.dart';
import 'package:dex_course/features/recovery/presentation/recovery_vm.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouteList {
  static const init = '/init';

  static const auth = '/auth';

  static const recovery = '/recovery';

  static const enterCode = '/enterCode';

  static const newPassword = '/newPassword';
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
      ),
      GoRoute(
        path: AppRouteList.recovery,
        builder: (context, state) {
          return RecoveryPage(
            vm: RecoveryViewModel(
              authRepository: AppContainer().repositoryScope.authRepository,
              settingService: AppContainer().serviceScope.settingsService,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRouteList.enterCode,
        builder: (context, state) {
          return EnterCodePage(
            vm: RecoveryViewModel(
              authRepository: AppContainer().repositoryScope.authRepository,
              settingService: AppContainer().serviceScope.settingsService,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRouteList.newPassword,
        builder: (context, state) {
          return NewPasswordPage(
            vm: RecoveryViewModel(
              authRepository: AppContainer().repositoryScope.authRepository,
              settingService: AppContainer().serviceScope.settingsService,
            ),
          );
        },
      ),
    ],
  );
}
