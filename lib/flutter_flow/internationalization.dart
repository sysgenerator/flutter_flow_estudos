import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

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
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
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
  // HomePage
  {
    '66a2iy19': {
      'pt': 'Hello World',
      'en': '',
    },
    '2b3jel47': {
      'pt': 'Sair',
      'en': '',
    },
    'ogqcxh59': {
      'pt': 'Página Inicial',
      'en': '',
    },
    'tnwjx4ps': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Login
  {
    'npjocpvc': {
      'pt': 'Login',
      'en': '',
    },
    'bzx2hc3l': {
      'pt': 'Email',
      'en': '',
    },
    '725ahg39': {
      'pt': 'Digite o seu e-mail ...',
      'en': '',
    },
    'xc7sl9d6': {
      'pt': 'Senha',
      'en': '',
    },
    '9x4kwp24': {
      'pt': 'Digite a sua Senha ...',
      'en': '',
    },
    'lu91dtih': {
      'pt': 'Entrar\n',
      'en': '',
    },
    '9xq9fhtb': {
      'pt': 'Login',
      'en': '',
    },
    'bv3zntcc': {
      'pt': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '9a9fa1om': {
      'pt': '',
      'en': '',
    },
    'sqorxjlz': {
      'pt': '',
      'en': '',
    },
    'asyl49dn': {
      'pt': '',
      'en': '',
    },
    '26dglw3z': {
      'pt': '',
      'en': '',
    },
    '2prhoknj': {
      'pt': '',
      'en': '',
    },
    'ze0i6by0': {
      'pt': '',
      'en': '',
    },
    '6t4bdmx5': {
      'pt': '',
      'en': '',
    },
    'uhxk14yu': {
      'pt': '',
      'en': '',
    },
    'r12kc2g5': {
      'pt': '',
      'en': '',
    },
    'akq6zbxc': {
      'pt': '',
      'en': '',
    },
    '2b69ivow': {
      'pt': '',
      'en': '',
    },
    '4l4bsun0': {
      'pt': '',
      'en': '',
    },
    'ykuk4ygn': {
      'pt': '',
      'en': '',
    },
    's4pf9h9i': {
      'pt': '',
      'en': '',
    },
    '9mfbg1gh': {
      'pt': '',
      'en': '',
    },
    'cit9vo7f': {
      'pt': '',
      'en': '',
    },
    'b73ql8ac': {
      'pt': '',
      'en': '',
    },
    '8yn8v07t': {
      'pt': '',
      'en': '',
    },
    'nex99yzi': {
      'pt': '',
      'en': '',
    },
    'htrcytq3': {
      'pt': '',
      'en': '',
    },
    'k4uhfq82': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
