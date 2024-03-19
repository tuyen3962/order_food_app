import 'package:go_router/go_router.dart';
import 'package:order_food_app/config/constant/app_constant_key.dart';
import 'package:order_food_app/l10n/app_localizations.dart';
import 'package:order_food_app/main.dart';
import 'package:order_food_app/router/app_route_constant.dart';
import 'package:path/path.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class IBaseRepository {
  late AppLocalizations l10n;

  handleError(error) {
    if (error is PostgrestException) {
      if (error.code == ERROR_CODE.UNAUTHOR) {
        navigatorKey.currentContext!.go(RouteName.SIGNIN);
      }
    }
    print(error);
  }
}
