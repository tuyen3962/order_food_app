import 'package:order_food_app/config/repository/ibase_repository.dart';

abstract class IAuthenRepository extends IBaseRepository {
  Future<bool> signInWithEmailPassword(
      {required String email, required String password});
  Future<void> signLogOut();
}
