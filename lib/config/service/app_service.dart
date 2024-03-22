import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:order_food_app/config/constant/app_config.dart';
import 'package:order_food_app/config/repository/account/account_repository.dart';
import 'package:order_food_app/config/repository/account/iaccount_repository.dart';
import 'package:order_food_app/config/repository/login/authen_repository.dart';
import 'package:order_food_app/config/repository/login/iauthen_repository.dart';
import 'package:order_food_app/config/repository/upload/iupload_repository.dart';
import 'package:order_food_app/config/repository/upload/upload_repository.dart';
import 'package:order_food_app/config/service/account_service.dart';
import 'package:order_food_app/config/service/server_service.dart';
import 'package:order_food_app/config/service/storage_service.dart';

final locator = GetIt.instance;

class AppService {
  /// init your service here for global using
  static Future<void> initAppService() async {
    await dotenv.load(fileName: 'assets/.env.dev');
    final appConfig = AppConfig(
      supabaseApiKey: dotenv.get('SUPABASE_API_KEY'),
      supabaseUrl: dotenv.get('SUPABASE_URL'),
    );
    locator.registerSingleton<AppConfig>(appConfig);

    final storage = StorageService();
    await storage.initService();
    locator.registerSingleton<StorageService>(storage);

    final server =
        ServerService(storageService: locator.get(), appConfig: locator.get());
    await server.init();

    locator.registerSingleton<ServerService>(server);

    locator.registerSingleton<IAuthenRepository>(
        AuthenRepository(serverService: locator.get()));
    locator.registerSingleton<IUploadRepository>(
        UploadRepository(serverService: server));

    locator.registerSingleton<IAccountRepository>(
        AccountRepository(serverService: locator.get()));

    locator.registerSingleton<AccountService>(AccountService(
      storageService: locator.get(),
      serverService: locator.get(),
    ));
  }
}
