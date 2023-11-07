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

  /// `Next`
  String get onBoardingButtonText {
    return Intl.message(
      'Next',
      name: 'onBoardingButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Discover the Cinematic Universe`
  String get onBoardingTitle1 {
    return Intl.message(
      'Discover the Cinematic Universe',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Personalized Recommendations`
  String get onBoardingTitle2 {
    return Intl.message(
      'Personalized Recommendations',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Seamless Movie Search`
  String get onBoardingTitle3 {
    return Intl.message(
      'Seamless Movie Search',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Embark on a journey through the world of movies and immerse yourself in captivating stories, from classic films to the latest blockbusters. Our app is your gateway to endless entertainmen`
  String get onBoardingDescription1 {
    return Intl.message(
      'Embark on a journey through the world of movies and immerse yourself in captivating stories, from classic films to the latest blockbusters. Our app is your gateway to endless entertainmen',
      name: 'onBoardingDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Experience tailored movie recommendations that cater to your unique tastes. Let our app be your movie guide, ensuring you never miss a film that suits your preferences`
  String get onBoardingDescription2 {
    return Intl.message(
      'Experience tailored movie recommendations that cater to your unique tastes. Let our app be your movie guide, ensuring you never miss a film that suits your preferences',
      name: 'onBoardingDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Effortlessly find your favorite movies or explore new gems with our intuitive search feature. Get instant access to movie details, reviews, and more. Your cinematic journey begins here`
  String get onBoardingDescription3 {
    return Intl.message(
      'Effortlessly find your favorite movies or explore new gems with our intuitive search feature. Get instant access to movie details, reviews, and more. Your cinematic journey begins here',
      name: 'onBoardingDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get onBoardingTextButtonText {
    return Intl.message(
      'Skip',
      name: 'onBoardingTextButtonText',
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
