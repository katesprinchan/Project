import 'package:dex_course/core/domain/intl/generated/l10n.dart';
import 'package:dex_course/core/presentation/app_bar.dart';
import 'package:dex_course/core/presentation/app_filled_button.dart';
import 'package:dex_course/core/presentation/app_text_field.dart';
import 'package:dex_course/core/presentation/button/app_bar_action_button.dart';
import 'package:dex_course/core/presentation/password_text_field.dart';
import 'package:dex_course/features/auth/presentation/auth_vm.dart';
import 'package:dex_course/routing.dart';
import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatefulWidget {
  final AuthViewModel vm;

  const AuthPage({
    super.key,
    required this.vm,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  AuthViewModel get vm => widget.vm;
  String get imAgreedWith => S
      .of(context)
      .imAgreedWithPrivacyAndPolicyUsage
      .split(' ')
      .getRange(0, 3)
      .join(' ');

  String get PnPUsage {
    final wordList = S.of(context).imAgreedWithPrivacyAndPolicyUsage.split(' ');
    return wordList.getRange(3, wordList.length).join(' ');
  }

  @override
  void initState() {
    vm.init(tabController: TabController(length: 2, vsync: this));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AuthPage oldWidget) {
    if (oldWidget.vm != widget.vm) {
      vm.init(tabController: oldWidget.vm.tabController);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  Widget get _tabBarBuilder => TabBar(
        controller: vm.tabController,
        tabs: [
          Tab(
            text: S.of(context).login,
          ),
          Tab(
            text: S.of(context).registration,
          ),
        ],
      );

  Widget get _tabViewBuilder => TabBarView(
        controller: vm.tabController,
        children: [
          _loginTabBuilder,
          _registerTabBuilder,
        ],
      );

  Widget get _loginTabBuilder => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 100),
            AppTextField(
              controller: vm.phoneLoginTextCtrl,
              labelText: S.of(context).phone,
              prefixIcon: const Icon(
                Icons.phone_outlined,
              ),
            ),
            const SizedBox(height: 20),
            PasswordTextField(
              controller: vm.passwordLoginTextCtrl,
              labelText: S.of(context).password,
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            vm.isLoginPossible.observer(
              (context, value) => AppFilledButton(
                onPressed: value
                    ? () {
                        context.go(AppRouteList.advertisementListPage);
                      }
                    : null,
                child: Text(S.of(context).signIn),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                context.go(AppRouteList.forgotPassword);
              },
              child: Text(S.of(context).forgotPassword),
            ),
          ],
        ),
      );

  Widget get _registerTabBuilder => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 100),
            AppTextField(
              controller: vm.phoneRegisterTextCtrl,
              labelText: S.of(context).phone,
              prefixIcon: const Icon(
                Icons.phone_outlined,
              ),
            ),
            const SizedBox(height: 20),
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vm.isUserAgreedWithPnPUsage.observer(
                  (context, value) => Checkbox(
                    value: value,
                    onChanged: vm.onCheckBoxChecked,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: RichText(
                      maxLines: 2,
                      textHeightBehavior: const TextHeightBehavior(),
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '$imAgreedWith ',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          TextSpan(
                            text: PnPUsage,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: ColorsCollection.primary,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            vm.isRegisterPossible.observer(
              (context, value) => AppFilledButton(
                onPressed: value ? vm.signUp : null,
                child: Text(S.of(context).signUp),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        actions: [
          AppBarActionButton(
            onTap: () => vm.onSettingsTap(context),
            child: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _tabBarBuilder,
          Expanded(child: _tabViewBuilder),
        ],
      ),
    );
  }
}
