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

  /// `Network Reconnected`
  String get networkReconnected {
    return Intl.message(
      'Network Reconnected',
      name: 'networkReconnected',
      desc: '',
      args: [],
    );
  }

  /// `Network Disconnected`
  String get networkDisconnected {
    return Intl.message(
      'Network Disconnected',
      name: 'networkDisconnected',
      desc: '',
      args: [],
    );
  }

  /// `You are now connected to the internet.`
  String get networkReconnectedDescription {
    return Intl.message(
      'You are now connected to the internet.',
      name: 'networkReconnectedDescription',
      desc: '',
      args: [],
    );
  }

  /// `You are no longer connected to the internet.`
  String get networkDisconnectedDescription {
    return Intl.message(
      'You are no longer connected to the internet.',
      name: 'networkDisconnectedDescription',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
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

  /// `On your way...`
  String get onboardingPage1Title {
    return Intl.message(
      'On your way...',
      name: 'onboardingPage1Title',
      desc: '',
      args: [],
    );
  }

  /// `to find the perfect looking Onboarding for your app?`
  String get onboardingPage1Description {
    return Intl.message(
      'to find the perfect looking Onboarding for your app?',
      name: 'onboardingPage1Description',
      desc: '',
      args: [],
    );
  }

  /// `You've reached your destination..`
  String get onboardingPage2Title {
    return Intl.message(
      'You\'ve reached your destination..',
      name: 'onboardingPage2Title',
      desc: '',
      args: [],
    );
  }

  /// `Sliding with animation`
  String get onboardingPage2Description {
    return Intl.message(
      'Sliding with animation',
      name: 'onboardingPage2Description',
      desc: '',
      args: [],
    );
  }

  /// `Start now!`
  String get onboardingPage3Title {
    return Intl.message(
      'Start now!',
      name: 'onboardingPage3Title',
      desc: '',
      args: [],
    );
  }

  /// `Where everything is possible and customize your onboarding.`
  String get onboardingPage3Description {
    return Intl.message(
      'Where everything is possible and customize your onboarding.',
      name: 'onboardingPage3Description',
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
