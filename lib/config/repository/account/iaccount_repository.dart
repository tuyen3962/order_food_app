import 'dart:io';

import 'package:order_food_app/config/model/account.dart';
import 'package:order_food_app/config/repository/ibase_repository.dart';

abstract class IAccountRepository extends IBaseRepository {
  Future<Account?> createAccount(
      {String email, String fullName, String password});
  Future<Account?> updateAccountModel(Account account);
  Future<List<Account>> getListAccountByKeyword(
    String keyword, {
    int page = 1,
    int limit = 10,
    List<String> unContainUid = const [],
  });
  Future<Account?> getAccountDetail(String id);
  Future<Account?> uploadAvatar(String id, File file);
  Future<Account?> uploadBackgroundImage(String id, File file);
  Future<Account?> updateMyProfile(String id, Map<String, dynamic> data);
}
