import 'package:dex_course/core/domain/intl/generated/l10n.dart';
import 'package:dex_course/core/presentation/app_bar.dart';
import 'package:dex_course/core/presentation/app_filled_button.dart';
import 'package:dex_course/core/presentation/button/app_bar_action_button.dart';
import 'package:dex_course/core/presentation/password_text_field.dart';
import 'package:dex_course/features/recovery/presentation/recovery_vm.dart';
import 'package:dex_course/routing.dart';
import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewPasswordPage extends StatefulWidget {
  final RecoveryViewModel vm;

  const NewPasswordPage({
    super.key,
    required this.vm,
  });

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage>
    with SingleTickerProviderStateMixin {
  RecoveryViewModel get vm => widget.vm;
  @override
  void initState() {
    vm.init();
    super.initState();
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  Widget get _inscription => Align(
        alignment: Alignment.centerLeft,
        child: Text(
          S.of(context).setNewPasswordConfirmItToCompleteReset,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorsCollection.onSurfaceVariant,
              ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(S.of(context).newPassword),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: ColorsCollection.outline, size: 24.0),
          onPressed: () {
            context.go(AppRouteList.enterCode);
          },
        ),
        context: context,
        actions: [
          AppBarActionButton(
            onTap: () => vm.onSettingsTap(context),
            child: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 100),
            _inscription,
            const SizedBox(
              height: 20,
            ),
            PasswordTextField(
              controller: vm.passwordRegisterTextCtrl,
              labelText: S.of(context).password,
            ),
            const SizedBox(height: 20),
            PasswordTextField(
              controller: vm.repeatPasswordRegisterTextCtrl,
              labelText: S.of(context).repeatPassword,
            ),
            const SizedBox(height: 20),
            vm.isSaveNewPasswordPossible.observer(
              (context, value) => AppFilledButton(
                onPressed: value ? vm.signUp : null,
                child: Text(S.of(context).saveNewPassword),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
