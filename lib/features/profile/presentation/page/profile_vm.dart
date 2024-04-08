import 'package:dex_course/features/settings/domain/service/settings_service.dart';
import 'package:dex_course/features/settings/presentation/settings_modal_bs.dart';
import 'package:flutter/material.dart';

class ProfileViewModel {
  final SettingsService _settingsService;

  ProfileViewModel({
    required SettingsService settingService,
  }) : _settingsService = settingService;

  void onSettingsTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) =>
          SettingsModalBottomSheet(settingsService: _settingsService),
      showDragHandle: true,
    );
  }
}
