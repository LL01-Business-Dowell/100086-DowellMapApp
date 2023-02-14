import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr', 'de'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? frText = '',
    String? deText = '',
  }) =>
      [enText, esText, frText, deText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // maps
  {
    'ewi5pxl1': {
      'en': 'DoWell Maps',
      'de': 'DoWell Maps',
      'es': 'DoWell Maps',
      'fr': 'DoWell Maps',
    },
    'ktsb4915': {
      'en': 'Select Location',
      'de': '',
      'es': '',
      'fr': '',
    },
    '4as6ways': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Casa',
      'fr': 'Domicile',
    },
  },
  // SplashScreen
  {
    'jp75ltd4': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // HomeScreen
  {
    'fdkg2jc3': {
      'en': 'DoWell Maps',
      'de': '',
      'es': '',
      'fr': '',
    },
    '0tx0bg15': {
      'en': 'Select Location',
      'de': '',
      'es': '',
      'fr': '',
    },
    '47tf81qn': {
      'en': 'Current Location',
      'de': '',
      'es': '',
      'fr': '',
    },
    '8chf4p2w': {
      'en': 'Specified Location',
      'de': '',
      'es': '',
      'fr': '',
    },
    '4hk1nic8': {
      'en': 'Search with',
      'de': '',
      'es': '',
      'fr': '',
    },
    'yg2z9jwh': {
      'en': 'Hint: Default distance is from 0',
      'de': '',
      'es': '',
      'fr': '',
    },
    'p4f4svlh': {
      'en': 'From Distance (m)',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ag6cv6sw': {
      'en': '0',
      'de': '',
      'es': '',
      'fr': '',
    },
    '8krhncx7': {
      'en': 'To Distance (m)',
      'de': '',
      'es': '',
      'fr': '',
    },
    'pjene2vn': {
      'en': '200000',
      'de': '',
      'es': '',
      'fr': '',
    },
    '4zq5e0x2': {
      'en': 'Search e.g park, school',
      'de': '',
      'es': '',
      'fr': '',
    },
    '2fexitic': {
      'en': 'school',
      'de': '',
      'es': '',
      'fr': '',
    },
    'p37zt8iy': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // GlobalTopMenuBar
  {
    'pop7fj2v': {
      'en': '6',
      'de': '',
      'es': '',
      'fr': '',
    },
    'qa12q3rw': {
      'en': 'Learning Mode',
      'de': '',
      'es': 'Modo de aprendizaje',
      'fr': '',
    },
  },
  // specifiedlocation
  {
    'bwki9q32': {
      'en': 'Select Location',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // searchboxCopy
  {
    '33zwskpq': {
      'en': 'Current Location',
      'de': 'Aktueller Standort',
      'es': 'Ubicación actual',
      'fr': 'Localisation actuelle',
    },
    'wc8xs5or': {
      'en': 'Specified Location',
      'de': 'Angegebener Ort',
      'es': 'Ubicación especificada',
      'fr': 'Emplacement spécifié',
    },
    '2fdlmlrc': {
      'en': 'Distance Between',
      'de': 'Abstand zwischen',
      'es': 'Distancia entre',
      'fr': 'Distance entre',
    },
    '3zy8ganu': {
      'en': 'From Distance',
      'de': 'Aus der Ferne',
      'es': 'Desde la distancia',
      'fr': 'À distance',
    },
    'argc8hr6': {
      'en': 'To Distance',
      'de': 'Sich distanzieren',
      'es': 'a la distancia',
      'fr': 'À distance',
    },
    '4yfj0fbm': {
      'en': 'Search  eg School, Park',
      'de': 'Stadt suchen',
      'es': 'Buscar ciudad',
      'fr': 'Rechercher une ville',
    },
  },
  // Miscellaneous
  {
    'bwnsa3x4': {
      'en': 'Please enable your location for better app funtionality ',
      'de': '',
      'es': '',
      'fr': '',
    },
    'm0x9oqn8': {
      'en': 'Dowell sales agent wants your location',
      'de': '',
      'es': '',
      'fr': '',
    },
    'v04fc5uu': {
      'en': 'Dowell sales agent wants to access your camera',
      'de': '',
      'es': '',
      'fr': '',
    },
    'x216tgil': {
      'en': 'Dowell sales agent wants to access your microphone',
      'de': '',
      'es': '',
      'fr': '',
    },
    'h0w5gavd': {
      'en': 'Dowell sales agent wants push notifications to you',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xb47c325': {
      'en': 'Dowell sales agent wants permission to share your photo library',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
