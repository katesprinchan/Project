import 'dart:developer';

import 'package:dex_course/core/domain/use_case_result/use_case_result.dart';
import 'package:dex_course/core/presentation/app_text_field/app_text_editing_controller.dart';
import 'package:dex_course/core/presentation/password_text_editing_controller.dart';
import 'package:dex_course/features/auth/domain/entity/auth_credentials.dart';
import 'package:dex_course/features/auth/domain/repository/auth_repository.dart';
import 'package:dex_course/features/settings/domain/service/settings_service.dart';
import 'package:dex_course/features/settings/presentation/settings_modal_bs.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class AuthViewModel {
  final AuthRepository _authRepository;
  final SettingsService _settingsService;

  AuthViewModel({
    required AuthRepository authRepository,
    required SettingsService settingService,
  })  : _authRepository = authRepository,
        _settingsService = settingService;

  late TabController tabController;

  final phoneLoginTextCtrl = AppTextEditingController();
  final passwordLoginTextCtrl = PassTextEditingController();
  final phoneRegisterTextCtrl = AppTextEditingController();
  final passwordRegisterTextCtrl = PassTextEditingController();
  final repeatPasswordRegisterTextCtrl = PassTextEditingController();

  final isUserAgreedWithPnPUsage = false.rv;

  final isLoginPossible = false.rv;

  final isRegisterPossible = false.rv;

  void init({
    required final TabController tabController,
  }) {
    this.tabController = tabController;
    initListeners();
  }

  void dispose() {
    disposeListeners();
  }

  void _loginPossibilityListener() {
    if (phoneLoginTextCtrl.text.isEmpty || passwordLoginTextCtrl.text.isEmpty) {
      isLoginPossible(false);
      return;
    }

    isLoginPossible(true);
  }

  void _registerPossibilityChanger() {
    if (!isUserAgreedWithPnPUsage()) {
      isRegisterPossible(false);
      return;
    }

    if (phoneRegisterTextCtrl.text.isEmpty ||
        passwordRegisterTextCtrl.text.isEmpty ||
        repeatPasswordRegisterTextCtrl.text.isEmpty) {
      isRegisterPossible(false);
      return;
    }

    // if (passwordRegisterTextCtrl.text != repeatPasswordRegisterTextCtrl.text) {
    //   isRegisterPossible(false);
    //   return;
    // }

    isRegisterPossible(true);
  }

  void _passwordVisibilityListener() {
    repeatPasswordRegisterTextCtrl
        .isTextHidden(passwordRegisterTextCtrl.isTextHidden());
  }

  void _repeatPasswordVisibilityListener() {
    passwordRegisterTextCtrl
        .isTextHidden(repeatPasswordRegisterTextCtrl.isTextHidden());
  }

  void initListeners() {
    isUserAgreedWithPnPUsage.addListener(_registerPossibilityChanger);
    phoneLoginTextCtrl.addListener(_loginPossibilityListener);
    passwordLoginTextCtrl.addListener(_loginPossibilityListener);
    passwordRegisterTextCtrl.isTextHidden
        .addListener(_passwordVisibilityListener);
    repeatPasswordRegisterTextCtrl.isTextHidden
        .addListener(_repeatPasswordVisibilityListener);
    phoneRegisterTextCtrl.addListener(_registerPossibilityChanger);
    passwordRegisterTextCtrl.addListener(_registerPossibilityChanger);
    repeatPasswordRegisterTextCtrl.addListener(_registerPossibilityChanger);
  }

  void disposeListeners() {
    isUserAgreedWithPnPUsage.removeListener(_registerPossibilityChanger);
    phoneLoginTextCtrl.removeListener(_loginPossibilityListener);
    passwordLoginTextCtrl.removeListener(_loginPossibilityListener);
    passwordRegisterTextCtrl.isTextHidden
        .removeListener(_passwordVisibilityListener);
    repeatPasswordRegisterTextCtrl.isTextHidden
        .removeListener(_repeatPasswordVisibilityListener);
    phoneRegisterTextCtrl.removeListener(_registerPossibilityChanger);
    passwordRegisterTextCtrl.removeListener(_registerPossibilityChanger);
    repeatPasswordRegisterTextCtrl.removeListener(_registerPossibilityChanger);
  }

  void onCheckBoxChecked(bool? value) =>
      isUserAgreedWithPnPUsage(value ?? false);

  Future<void> signIn() async {
    final result = await _authRepository.signIn(
      phone: phoneLoginTextCtrl.text,
      password: passwordLoginTextCtrl.text,
    );

    switch (result) {
      case GoodUseCaseResult<AuthCredentials>(:final data):
        log(data.jvtToken);
        break;
      case BadUseCaseResult<AuthCredentials>(:final errorList):
        for (final error in errorList) {
          log(error.code);
        }
        break;
    }
  }

  Future<void> signUp() async {
    final result = await _authRepository.signUp(
      password: passwordRegisterTextCtrl.text,
      repeatPassword: repeatPasswordRegisterTextCtrl.text,
    );

    switch (result) {
      case GoodUseCaseResult<AuthCredentials>(:final data):
        log(data.jvtToken);
        break;
      case BadUseCaseResult<AuthCredentials>(:final errorList):
        for (final error in errorList) {
          log(error.code);
        }
        break;
    }
  }

  void onSettingsTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) =>
          SettingsModalBottomSheet(settingsService: _settingsService),
      showDragHandle: true,
    );
  }
}
