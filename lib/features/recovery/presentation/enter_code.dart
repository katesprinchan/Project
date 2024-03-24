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

class EnterCodePage extends StatefulWidget {
  final RecoveryViewModel vm;
  const EnterCodePage({
    super.key,
    required this.vm,
  });

  @override
  State<EnterCodePage> createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage>
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
          S.of(context).enterCodeSentToTheNumber,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorsCollection.onSurfaceVariant,
              ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(S.of(context).enterCode),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: ColorsCollection.outline, size: 24.0),
          onPressed: () {
            context.go(AppRouteList.recovery);
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
            Row(
              children: [
                Expanded(
                  child: AppNumberTextField(
                    controller: vm.numberLoginTextCtrl1,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: AppNumberTextField(
                    controller: vm.numberLoginTextCtrl2,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: AppNumberTextField(
                    controller: vm.numberLoginTextCtrl3,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: AppNumberTextField(
                    controller: vm.numberLoginTextCtrl4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            vm.isSendPossible.observer(
              (context, value) => AppFilledButton(
                onPressed: value
                    ? () async {
                        await vm.enterCode();
                        context.go(AppRouteList.newPassword);
                      }
                    : null,
                child: Text(S.of(context).confirm),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(ColorsCollection.primary),
              ),
              child: Text(S.of(context).resendCode),
            ),
          ],
        ),
      ),
    );
  }
}
