import 'package:dex_course/core/domain/intl/generated/l10n.dart';
import 'package:dex_course/core/presentation/app_bar.dart';
import 'package:dex_course/core/presentation/app_filled_button.dart';
import 'package:dex_course/core/presentation/app_text_field.dart';
import 'package:dex_course/core/presentation/button/app_bar_action_button.dart';
import 'package:dex_course/features/recovery/presentation/recovery_vm.dart';
import 'package:dex_course/routing.dart';
import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecoveryPage extends StatefulWidget {
  final RecoveryViewModel vm;
  const RecoveryPage({
    super.key,
    required this.vm,
  });

  @override
  State<RecoveryPage> createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage>
    with SingleTickerProviderStateMixin {
  RecoveryViewModel get vm => widget.vm;
  @override
  void initState() {
    vm.init();
    super.initState();
  }

  Widget get _inscription => Align(
        alignment: Alignment.centerLeft,
        child: Text(
          S.of(context).enterNumberToWhichPasswordResetCodeWillBeSent,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorsCollection.onSurfaceVariant,
              ),
        ),
      );
  Widget get _phoneTextField => AppTextField(
        controller: vm.phoneLoginTextCtrl,
        labelText: S.of(context).phone,
        prefixIcon: const Icon(
          Icons.phone_outlined,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(S.of(context).recoveryPassword),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: ColorsCollection.outline, size: 24.0),
          onPressed: () {
            context.go(AppRouteList.auth);
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
            const SizedBox(height: 20),
            _phoneTextField,
            const SizedBox(height: 20),
            vm.isLoginPossible.observer(
              (context, value) => AppFilledButton(
                onPressed: value
                    ? () async {
                        await vm.recoveryPassword();
                        context.go(AppRouteList.enterCode);
                      }
                    : null,
                child: Text(S.of(context).send),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
