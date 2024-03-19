import 'package:order_food_app/config/constant/app_config.dart';
import 'package:order_food_app/config/service/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ServerService {
  final StorageService storageService;
  final AppConfig appConfig;
  late final Supabase supabase;

  SupabaseClient get supabaseClient => supabase.client;

  ServerService({required this.storageService, required this.appConfig});

  init() async {
    supabase = await Supabase.initialize(
      url: appConfig.supabaseUrl,
      anonKey: appConfig.supabaseApiKey,
      postgrestOptions: const PostgrestClientOptions(),
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce,
      ),
      realtimeClientOptions: const RealtimeClientOptions(
        logLevel: RealtimeLogLevel.info,
      ),
      storageOptions: const StorageClientOptions(retryAttempts: 10),
    );
  }
}
