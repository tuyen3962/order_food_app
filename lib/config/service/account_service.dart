//handle account data in here

import 'package:order_food_app/config/service/server_service.dart';
import 'package:order_food_app/config/service/storage_service.dart';

class AccountService {
  final StorageService storageService;
  final ServerService serverService;

  AccountService({
    required this.storageService,
    required this.serverService,
  });

  bool isLogin() {
    return serverService.supabaseClient.auth.currentSession != null;
  }
}
