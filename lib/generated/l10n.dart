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

  /// `MEMOS`
  String get main_title {
    return Intl.message(
      'MEMOS',
      name: 'main_title',
      desc: '',
      args: [],
    );
  }

  /// `BOX`
  String get temporary_storage_title {
    return Intl.message(
      'BOX',
      name: 'temporary_storage_title',
      desc: '',
      args: [],
    );
  }

  /// `TAGS`
  String get tags_title {
    return Intl.message(
      'TAGS',
      name: 'tags_title',
      desc: '',
      args: [],
    );
  }

  /// `RESOURCE`
  String get resource_title {
    return Intl.message(
      'RESOURCE',
      name: 'resource_title',
      desc: '',
      args: [],
    );
  }

  /// `Language Settings`
  String get lang_setting {
    return Intl.message(
      'Language Settings',
      name: 'lang_setting',
      desc: '',
      args: [],
    );
  }

  /// `Chinese`
  String get settingLanguageChinese {
    return Intl.message(
      'Chinese',
      name: 'settingLanguageChinese',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get settingLanguageEnglish {
    return Intl.message(
      'English',
      name: 'settingLanguageEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get lang_lange {
    return Intl.message(
      'Language',
      name: 'lang_lange',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get lang_share {
    return Intl.message(
      'Share',
      name: 'lang_share',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get lang_help {
    return Intl.message(
      'Help',
      name: 'lang_help',
      desc: '',
      args: [],
    );
  }

  /// `Font size`
  String get lang_font_size {
    return Intl.message(
      'Font size',
      name: 'lang_font_size',
      desc: '',
      args: [],
    );
  }

  /// `Theme colors`
  String get lang_theme_color {
    return Intl.message(
      'Theme colors',
      name: 'lang_theme_color',
      desc: '',
      args: [],
    );
  }

  /// `Clearing the cache`
  String get lang_clear_cache {
    return Intl.message(
      'Clearing the cache',
      name: 'lang_clear_cache',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get lang_log_out {
    return Intl.message(
      'Log Out',
      name: 'lang_log_out',
      desc: '',
      args: [],
    );
  }

  /// `Official Website`
  String get lang_official_website {
    return Intl.message(
      'Official Website',
      name: 'lang_official_website',
      desc: '',
      args: [],
    );
  }

  /// `Terms Conditions`
  String get lang_terms_conditions {
    return Intl.message(
      'Terms Conditions',
      name: 'lang_terms_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get lang_privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'lang_privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get lang_feedback {
    return Intl.message(
      'Feedback',
      name: 'lang_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get lang_contact {
    return Intl.message(
      'Contact Us',
      name: 'lang_contact',
      desc: '',
      args: [],
    );
  }

  /// `Update Records`
  String get lang_update_records {
    return Intl.message(
      'Update Records',
      name: 'lang_update_records',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get lang_about {
    return Intl.message(
      'About',
      name: 'lang_about',
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
      Locale.fromSubtags(languageCode: 'jp'),
      Locale.fromSubtags(languageCode: 'kn'),
      Locale.fromSubtags(languageCode: 'zh'),
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
