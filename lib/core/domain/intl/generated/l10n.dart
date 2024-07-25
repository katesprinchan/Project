// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registration {
    return Intl.message(
      'Registration',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Repeat password`
  String get repeatPassword {
    return Intl.message(
      'Repeat password',
      name: 'repeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `I''m agreed with Privacy and Policy usage`
  String get imAgreedWithPrivacyAndPolicyUsage {
    return Intl.message(
      'I\'\'m agreed with Privacy and Policy usage',
      name: 'imAgreedWithPrivacyAndPolicyUsage',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Dark theme`
  String get darkTheme {
    return Intl.message(
      'Dark theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Recovery password`
  String get recoveryPassword {
    return Intl.message(
      'Recovery password',
      name: 'recoveryPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter the number to which the password reset code will be sent`
  String get enterNumberToWhichPasswordResetCodeWillBeSent {
    return Intl.message(
      'Enter the number to which the password reset code will be sent',
      name: 'enterNumberToWhichPasswordResetCodeWillBeSent',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Enter Code`
  String get enterCode {
    return Intl.message(
      'Enter Code',
      name: 'enterCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to the number`
  String get enterCodeSentToTheNumber {
    return Intl.message(
      'Enter the code sent to the number',
      name: 'enterCodeSentToTheNumber',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Resend the code`
  String get resendCode {
    return Intl.message(
      'Resend the code',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Save new password`
  String get saveNewPassword {
    return Intl.message(
      'Save new password',
      name: 'saveNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Set a new password and confirm it to complete the reset.`
  String get setNewPasswordConfirmItToCompleteReset {
    return Intl.message(
      'Set a new password and confirm it to complete the reset.',
      name: 'setNewPasswordConfirmItToCompleteReset',
      desc: '',
      args: [],
    );
  }

  /// `Search for advertisement`
  String get searchForAdvertisement {
    return Intl.message(
      'Search for advertisement',
      name: 'searchForAdvertisement',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `My`
  String get my {
    return Intl.message(
      'My',
      name: 'my',
      desc: '',
      args: [],
    );
  }

  /// `Advertisement`
  String get advertisement {
    return Intl.message(
      'Advertisement',
      name: 'advertisement',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Tiraspol`
  String get tiraspol {
    return Intl.message(
      'Tiraspol',
      name: 'tiraspol',
      desc: '',
      args: [],
    );
  }

  /// `Rybnitsa`
  String get rybnitsa {
    return Intl.message(
      'Rybnitsa',
      name: 'rybnitsa',
      desc: '',
      args: [],
    );
  }

  /// `Bender`
  String get bender {
    return Intl.message(
      'Bender',
      name: 'bender',
      desc: '',
      args: [],
    );
  }

  /// `Dubossary`
  String get dubossary {
    return Intl.message(
      'Dubossary',
      name: 'dubossary',
      desc: '',
      args: [],
    );
  }

  /// `Grigoriopol`
  String get grigoriopol {
    return Intl.message(
      'Grigoriopol',
      name: 'grigoriopol',
      desc: '',
      args: [],
    );
  }

  /// `Kamenka`
  String get kamenka {
    return Intl.message(
      'Kamenka',
      name: 'kamenka',
      desc: '',
      args: [],
    );
  }

  /// `Slobodzeya`
  String get slobodzeya {
    return Intl.message(
      'Slobodzeya',
      name: 'slobodzeya',
      desc: '',
      args: [],
    );
  }

  /// `Dnestrovsk`
  String get dnestrovsk {
    return Intl.message(
      'Dnestrovsk',
      name: 'dnestrovsk',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filter {
    return Intl.message(
      'Filters',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Add city`
  String get addCity {
    return Intl.message(
      'Add city',
      name: 'addCity',
      desc: '',
      args: [],
    );
  }

  /// `Go Out`
  String get goOut {
    return Intl.message(
      'Go Out',
      name: 'goOut',
      desc: '',
      args: [],
    );
  }

  /// `About the application`
  String get aboutApplication {
    return Intl.message(
      'About the application',
      name: 'aboutApplication',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any advertisement yet`
  String get youDontHaveAnyAdvertisementYet {
    return Intl.message(
      'You don\'t have any advertisement yet',
      name: 'youDontHaveAnyAdvertisementYet',
      desc: '',
      args: [],
    );
  }

  /// `Don't miss the opportunity!\n Create and publish your ad right now to offer products or services to a wide audience.`
  String get dontMisstheOpportunity {
    return Intl.message(
      'Don\'t miss the opportunity!\n Create and publish your ad right now to offer products or services to a wide audience.',
      name: 'dontMisstheOpportunity',
      desc: '',
      args: [],
    );
  }

  /// `Add advertisements to favorites`
  String get addAdvertisementsToFavorites {
    return Intl.message(
      'Add advertisements to favorites',
      name: 'addAdvertisementsToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `You can come back to them later`
  String get youCanComeBackToThemLater {
    return Intl.message(
      'You can come back to them later',
      name: 'youCanComeBackToThemLater',
      desc: '',
      args: [],
    );
  }

  /// `Favorites `
  String get favorite {
    return Intl.message(
      'Favorites ',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Editing profile`
  String get editingProfile {
    return Intl.message(
      'Editing profile',
      name: 'editingProfile',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
