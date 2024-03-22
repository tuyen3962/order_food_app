import 'dart:io';
import 'package:order_food_app/config/constant/app_constant_key.dart';
import 'package:order_food_app/config/model/account.dart';
import 'package:order_food_app/config/repository/account/iaccount_repository.dart';
import 'package:order_food_app/config/service/server_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccountRepository extends IAccountRepository {
  final ServerService serverService;
  SupabaseClient get _client => serverService.supabaseClient;

  AccountRepository({required this.serverService});

  @override
  Future<Account?> createAccount(
      {String email = '', String fullName = '', String password = ''}) async {
    try {
      final response =
          await _client.auth.signUp(email: email, password: password);
      if (response.user != null) {
        final account =
            Account(id: response.user!.id, email: email, fullName: fullName);
        await _client.from(TABLE_NAME.USER).insert(account.toJson());
        return account;
      }
      return null;
    } catch (e) {
      throw handleError(e);
    }
  }

  @override
  Future<Account?> getAccountDetail(String id) {
    // TODO: implement getAccountDetail
    throw UnimplementedError();
  }

  @override
  Future<List<Account>> getListAccountByKeyword(String keyword,
      {int page = 1, int limit = 10, List<String> unContainUid = const []}) {
    // TODO: implement getListAccountByKeyword
    throw UnimplementedError();
  }

  @override
  Future<Account?> updateAccountModel(Account account) {
    // TODO: implement updateAccountModel
    throw UnimplementedError();
  }

  @override
  Future<Account?> updateMyProfile(String id, Map<String, dynamic> data) {
    // TODO: implement updateMyProfile
    throw UnimplementedError();
  }

  @override
  Future<Account?> uploadAvatar(String id, File file) {
    // TODO: implement uploadAvatar
    throw UnimplementedError();
  }

  @override
  Future<Account?> uploadBackgroundImage(String id, File file) {
    // TODO: implement uploadBackgroundImage
    throw UnimplementedError();
  }
}
