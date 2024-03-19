import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:order_food_app/config/constant/app_constant_key.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:order_food_app/config/theme/base_theme_data.dart';
import 'package:order_food_app/l10n/app_localizations.dart';
import 'package:order_food_app/l10n/language_constants.dart';
import 'package:order_food_app/router/app_route.dart';
import 'package:order_food_app/config/service/app_service.dart';
import 'package:order_food_app/config/theme/app_theme_util.dart';
import 'package:order_food_app/utils/reponsive/size_config.dart';
import 'bootstrap.dart';

final navigatorKey = GlobalKey<NavigatorState>();
AppThemeUtil themeUtil = AppThemeUtil();

BaseThemeData get appTheme => themeUtil.getAppTheme();
final ReceivePort backgroundMessageport = ReceivePort();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppService.initAppService();
  bootstrap(() {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig.instance.init(
            constraints: constraints, screenHeight: 812, screenWidth: 375);

        return const MainAppPage();
      },
    );
  });
}

class MainAppPage extends StatefulWidget {
  const MainAppPage({super.key});

  static MainAppPageState of(BuildContext context) {
    final state = context.findAncestorStateOfType<MainAppPageState>();

    if (state == null) {
      throw Exception('The state still not init');
    }

    return state;
  }

  @override
  State<MainAppPage> createState() => MainAppPageState();
}

class MainAppPageState extends State<MainAppPage> {
  Locale _locale = const Locale("vi");
  final _localeStream = StreamController<Locale?>.broadcast();

  void onSwitchLightDarkMode() {
    themeUtil.onChangeLightDarkMode();
  }

  @override
  void initState() {
    super.initState();
    _localeStream.stream.listen((locale) {
      if (locale != null) {
        _locale = locale;
        setLocale(locale.languageCode, locale.countryCode ?? '');
      }
    });
    _localeStream.add(_locale);
    getLocale().then((value) => _localeStream.add(value));
  }

  Locale get locale => _locale;

  set locale(Locale locale) {
    _localeStream.add(locale);
  }

  void handleLanguageChange(Locale locale) async {
    final pref = await SharedPreferences.getInstance();
    (pref.getString(LAGUAGE_CODE) ?? '').isNotEmpty;
    this.locale = locale;
  }

  @override
  void dispose() {
    themeUtil.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _localeStream.stream,
      initialData: _locale,
      builder: (context, snapshot) => ValueListenableBuilder(
          valueListenable: themeUtil.themeType,
          builder: (context, type, child) {
            return MaterialApp.router(
              locale: _locale,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                AppLocalizations.delegate,
              ],
              supportedLocales: supportedLocales,
              debugShowCheckedModeBanner: false,
              theme: themeUtil.theme.getThemeData(type),
              routerConfig: AppRoute.mainRouter,
              builder: EasyLoading.init(
                builder: (context, child) => MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child!,
                ),
              ),
            );
          }),
    );
  }
}
